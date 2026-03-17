#!/usr/bin/env python3
"""
lua/plugins/ を走査して README.md のプラグイン一覧を更新するスクリプト。
用途欄が空のプラグインは空欄のまま出力する（Claude skill で補完することを想定）。

使い方:
    python3 update_plugins.py
"""

import os
import re
import glob

NVIM_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PLUGINS_DIR = os.path.join(NVIM_ROOT, "lua/plugins")
README_PATH = os.path.join(NVIM_ROOT, "README.md")
SECTION_HEADER = "## プラグイン一覧"


def extract_plugin_id(lua_content: str) -> str | None:
    match = re.search(
        r"return\s*\{[^{]*?['\"]([a-zA-Z0-9_.-]+/[a-zA-Z0-9_.-]+)['\"]",
        lua_content,
        re.DOTALL,
    )
    return match.group(1) if match else None


def get_display_name(plugin_id: str, lua_content: str) -> str:
    spec_header = re.split(r'\bfunction\b', lua_content, maxsplit=1)[0]
    name_match = re.search(r'(?<!\w)name\s*=\s*["\']([^"\']+)["\']', spec_header)
    return name_match.group(1) if name_match else plugin_id.split("/")[-1]


def parse_existing_descriptions(readme_content: str) -> dict[str, str]:
    result = {}
    for line in readme_content.splitlines():
        url_match = re.search(r'\[([^\]]+)\]\(https://github\.com/([^)]+)\)', line)
        if not url_match:
            continue
        github_path = url_match.group(2).strip().rstrip("/")
        cells = [c.strip() for c in line.split("|")]
        inner = cells[1:-1]
        result[github_path] = inner[-1] if len(inner) >= 2 else ""
    return result


def scan_plugins() -> list[dict]:
    plugins = []
    for lua_file in sorted(glob.glob(os.path.join(PLUGINS_DIR, "**/*.lua"), recursive=True)):
        with open(lua_file, encoding="utf-8") as f:
            content = f.read()
        plugin_id = extract_plugin_id(content)
        if not plugin_id:
            continue
        rel = os.path.relpath(lua_file, PLUGINS_DIR)
        category = os.path.dirname(rel) or "root"
        display = get_display_name(plugin_id, content)
        plugins.append({"id": plugin_id, "display": display, "category": category})
    return plugins


def build_table(plugins: list[dict], existing_desc: dict[str, str]) -> str:
    lines = [
        "| プラグイン | カテゴリ | 用途 |",
        "|-----------|----------|------|",
    ]
    for p in plugins:
        url = f"https://github.com/{p['id']}"
        desc = existing_desc.get(p["id"], "")
        lines.append(f"| [{p['display']}]({url}) | `{p['category']}` | {desc} |")
    return "\n".join(lines)


def update_readme(new_table: str) -> None:
    with open(README_PATH, encoding="utf-8") as f:
        content = f.read()

    section_start = content.find(SECTION_HEADER)
    if section_start == -1:
        content += f"\n\n{SECTION_HEADER}\n\n{new_table}\n"
        with open(README_PATH, "w", encoding="utf-8") as f:
            f.write(content)
        return

    after = content[section_start + len(SECTION_HEADER):]
    next_sec = re.search(r"\n## ", after)
    rest = after[next_sec.start():] if next_sec else ""

    new_content = content[:section_start] + SECTION_HEADER + f"\n\n{new_table}\n" + rest
    with open(README_PATH, "w", encoding="utf-8") as f:
        f.write(new_content)


def main() -> None:
    with open(README_PATH, encoding="utf-8") as f:
        readme = f.read()

    existing_desc = parse_existing_descriptions(readme)
    plugins = scan_plugins()
    new_table = build_table(plugins, existing_desc)
    update_readme(new_table)

    new_count = sum(1 for p in plugins if not existing_desc.get(p["id"]))
    print(f"✓ {len(plugins)} 件のプラグインを検出")
    if new_count:
        print(f"  うち {new_count} 件は用途が未記入です（skill で補完してください）")
    print("✓ README.md を更新しました")


if __name__ == "__main__":
    main()
