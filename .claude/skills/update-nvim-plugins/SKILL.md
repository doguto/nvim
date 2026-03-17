---
name: update-nvim-plugins
description: lua/plugins/ を走査してREADMEのプラグイン一覧を更新し、用途欄が空のプラグインをClaudeが自動で補完する
user-invocable: true
allowed-tools: Bash, Read, Edit
---

# Update Neovim Plugins

`lua/plugins/` 配下の `.lua` ファイルをスキャンし、`README.md` の「プラグイン一覧」セクションを最新状態に更新するスキルです。

## 実行手順

### Step 1: スキャンスクリプトを実行

```bash
python3 scripts/update_plugins.py
```

このスクリプトが README のテーブルを自動更新します。用途欄が空のプラグインは空欄のまま出力されます。

### Step 2: README を読んで空欄を特定

`README.md` の `## プラグイン一覧` セクションを読み、用途欄が空のプラグインを特定してください。

### Step 3: 空欄の用途を補完

用途欄が空のプラグインについて、プラグイン名と設定内容からあなたの知識で日本語の用途説明を補完し、`README.md` を直接 Edit してください。

- 説明は簡潔に（10〜20文字程度）
- 例: 「インデントガイドの可視化」「ファイルツリー」「キーバインドヘルプ表示」

### Step 4: 結果を報告

- 補完したプラグイン名と説明の一覧を報告する
