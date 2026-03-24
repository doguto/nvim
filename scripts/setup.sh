#!/usr/bin/env bash
# =============================================================================
# Neovim 設定のセットアップスクリプト (Linux / macOS)
# =============================================================================

set -euo pipefail

# ─── ログ出力 ─────────────────────────────────────────────────────────────────
log() {
  local level="$1"; shift
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $*"
}

log_info()  { log "INFO " "$@"; }
log_warn()  { log "WARN " "$@"; }
log_error() { log "ERROR" "$@" >&2; exit 1; }
log_done()  { log "DONE " "$@"; }

# ─── OS 判定 ─────────────────────────────────────────────────────────────────
detect_os() {
  case "$(uname -s)" in
    Linux*)  echo "linux"  ;;
    Darwin*) echo "macos"  ;;
    *)       log_error "サポート外のOS: $(uname -s)" ;;
  esac
}

OS=$(detect_os)
log_info "OS検出: $OS"

# ─── パッケージインストール関数 ───────────────────────────────────────────────
install_packages() {
  if [[ "$OS" == "linux" ]]; then
    log_info "apt-get install 実行: $*"
    sudo apt-get update -qq
    sudo apt-get install -y "$@"
  else
    if ! command -v brew &>/dev/null; then
      log_warn "Homebrew が見つからないためインストールします"
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    log_info "brew install 実行: $*"
    brew install "$@"
  fi
}

# ─── 各ツールのインストール ───────────────────────────────────────────────────

install_git() {
  if command -v git &>/dev/null; then
    log_info "git: インストール済み ($(git --version))"
    return
  fi
  log_info "git: インストール開始"
  install_packages git
  log_done "git: インストール完了"
}

# C コンパイラ (nvim-treesitter のパーサービルドに必要)
install_compiler() {
  if command -v gcc &>/dev/null || command -v clang &>/dev/null; then
    log_info "Cコンパイラ: インストール済み"
    return
  fi
  log_info "Cコンパイラ: インストール開始"
  if [[ "$OS" == "linux" ]]; then
    install_packages build-essential
  else
    log_warn "Cコンパイラ: macOS では 'xcode-select --install' を手動実行してください"
    xcode-select --install 2>/dev/null || true
  fi
  log_done "Cコンパイラ: インストール完了"
}

install_neovim() {
  if command -v nvim &>/dev/null; then
    log_info "neovim: インストール済み ($(nvim --version | head -1))"
    return
  fi
  log_info "neovim: インストール開始"
  if [[ "$OS" == "linux" ]]; then
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo apt-get update -qq
    sudo apt-get install -y neovim
  else
    install_packages neovim
  fi
  log_done "neovim: インストール完了 ($(nvim --version | head -1))"
}

# ripgrep: telescope live_grep に必須
install_ripgrep() {
  if command -v rg &>/dev/null; then
    log_info "ripgrep: インストール済み ($(rg --version | head -1))"
    return
  fi
  log_info "ripgrep: インストール開始"
  install_packages ripgrep
  log_done "ripgrep: インストール完了 ($(rg --version | head -1))"
}

# fd: telescope find_files で高速化
install_fd() {
  if command -v fd &>/dev/null; then
    log_info "fd: インストール済み ($(fd --version))"
    return
  fi
  log_info "fd: インストール開始"
  if [[ "$OS" == "linux" ]]; then
    install_packages fd-find
    # apt では fdfind としてインストールされるので symlink を作成
    mkdir -p "$HOME/.local/bin"
    ln -sf "$(which fdfind)" "$HOME/.local/bin/fd"
    log_info "fd: シンボリックリンク作成 fdfind -> ~/.local/bin/fd"
  else
    install_packages fd
  fi
  log_done "fd: インストール完了"
}

# Node.js: coc.nvim, copilot.vim に必須
install_node() {
  if command -v node &>/dev/null; then
    log_info "node: インストール済み ($(node --version))"
    return
  fi
  log_info "node: インストール開始"
  if [[ "$OS" == "linux" ]]; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
  else
    install_packages node
  fi
  log_done "node: インストール完了 ($(node --version))"
}

# ─── メイン処理 ───────────────────────────────────────────────────────────────
main() {
  log_info "========================================="
  log_info "Neovim 環境セットアップ 開始"
  log_info "========================================="

  install_git
  install_compiler
  install_neovim
  install_ripgrep
  install_fd
  install_node

  log_info "========================================="
  log_done "セットアップ完了"
  log_info "nvim を起動して :Lazy sync を実行してください"
  log_info "========================================="
}

main "$@"
