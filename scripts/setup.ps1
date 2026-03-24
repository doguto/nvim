# =============================================================================
# Neovim 設定のセットアップスクリプト (Windows)
# =============================================================================

#Requires -Version 5.1

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ─── ログ出力 ─────────────────────────────────────────────────────────────────
function Write-Log {
  param([string]$Level, [string]$Message)
  $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
  Write-Host "[$timestamp] [$Level] $Message"
}

function log_info  { param([string]$msg) Write-Log "INFO " $msg }
function log_warn  { param([string]$msg) Write-Log "WARN " $msg }
function log_done  { param([string]$msg) Write-Log "DONE " $msg }
function log_error { param([string]$msg) Write-Log "ERROR" $msg; exit 1 }

# ─── winget インストール関数 ──────────────────────────────────────────────────
function Install-Package {
  param([string]$Name, [string]$Id)
  log_info "${Name}: winget install 実行 (${Id})"
  winget install --id $Id --silent --accept-package-agreements --accept-source-agreements
  log_done "${Name}: インストール完了"
}

# ─── コマンド存在チェック ─────────────────────────────────────────────────────
function Test-Command {
  param([string]$Command)
  return [bool](Get-Command $Command -ErrorAction SilentlyContinue)
}

# ─── 各ツールのインストール ───────────────────────────────────────────────────

function Install-Git {
  if (Test-Command "git") {
    log_info "git: インストール済み ($(git --version))"
    return
  }
  log_info "git: インストール開始"
  Install-Package "git" "Git.Git"
}

function Install-Neovim {
  if (Test-Command "nvim") {
    $ver = nvim --version | Select-Object -First 1
    log_info "neovim: インストール済み ($ver)"
    return
  }
  log_info "neovim: インストール開始"
  Install-Package "neovim" "Neovim.Neovim"
}

# ripgrep: telescope live_grep に必須
function Install-Ripgrep {
  if (Test-Command "rg") {
    log_info "ripgrep: インストール済み ($(rg --version | Select-Object -First 1))"
    return
  }
  log_info "ripgrep: インストール開始"
  Install-Package "ripgrep" "BurntSushi.ripgrep.MSVC"
}

# fd: telescope find_files で高速化
function Install-Fd {
  if (Test-Command "fd") {
    log_info "fd: インストール済み ($(fd --version))"
    return
  }
  log_info "fd: インストール開始"
  Install-Package "fd" "sharkdp.fd"
}

# Node.js: coc.nvim, copilot.vim に必須
function Install-Node {
  if (Test-Command "node") {
    log_info "node: インストール済み ($(node --version))"
    return
  }
  log_info "node: インストール開始"
  Install-Package "node" "OpenJS.NodeJS.LTS"
}

# ─── メイン処理 ───────────────────────────────────────────────────────────────
function Main {
  log_info "========================================="
  log_info "Neovim 環境セットアップ 開始"
  log_info "========================================="

  # winget の存在確認
  if (-not (Test-Command "winget")) {
    log_error "winget が見つかりません。Windows 10 1709 以降が必要です"
  }

  Install-Git
  Install-Neovim
  Install-Ripgrep
  Install-Fd
  Install-Node

  log_info "========================================="
  log_done "セットアップ完了"
  log_info "nvim を起動して :Lazy sync を実行してください"
  log_info "========================================="
}

Main
