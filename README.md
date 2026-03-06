# Neovim 設定

## キーマップ一覧

> `<leader>` = `Space`

---

### 基本操作

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `<leader>w` | Normal | ファイルを保存 (`:w`) | `lua/config/init.lua` |
| `<leader>q` | Normal | 終了 (`:q`) | `lua/config/init.lua` |

---

### LSP (言語サーバー)

LSP がアタッチされたバッファでのみ有効

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `gd` | Normal | 定義へジャンプ | `lua/config/lsp.lua` |
| `<leader>k` | Normal | ホバードキュメントを表示 | `lua/config/lsp.lua` |

---

### 補完 (nvim-cmp)

挿入モードで有効

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `<C-d>` | Insert | ドキュメントを上にスクロール | `lua/plugins/nvim-cmp.lua` |
| `<C-f>` | Insert | ドキュメントを下にスクロール | `lua/plugins/nvim-cmp.lua` |
| `<C-Space>` | Insert | 補完を手動で起動 | `lua/plugins/nvim-cmp.lua` |
| `<C-e>` | Insert | 補完を閉じる | `lua/plugins/nvim-cmp.lua` |
| `<CR>` | Insert | 補完を確定 | `lua/plugins/nvim-cmp.lua` |

---

### タブ操作 (barbar.nvim)

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `<A-,>` | Normal | 前のタブへ移動 | `lua/plugins/barbar.lua` |
| `<A-.>` | Normal | 次のタブへ移動 | `lua/plugins/barbar.lua` |
| `<A-c>` | Normal | 現在のタブを閉じる | `lua/plugins/barbar.lua` |
| `<A-1>` | Normal | タブ 1 へ移動 | `lua/plugins/barbar.lua` |
| `<A-2>` | Normal | タブ 2 へ移動 | `lua/plugins/barbar.lua` |
| `<A-3>` | Normal | タブ 3 へ移動 | `lua/plugins/barbar.lua` |
| `<A-4>` | Normal | タブ 4 へ移動 | `lua/plugins/barbar.lua` |
| `<A-5>` | Normal | タブ 5 へ移動 | `lua/plugins/barbar.lua` |

---

## プラグイン一覧

| プラグイン | 用途 |
|-----------|------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | プラグインマネージャー |
| [catppuccin](https://github.com/catppuccin/nvim) | カラースキーム |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | ステータスライン |
| [barbar.nvim](https://github.com/romgrk/barbar.nvim) | タブバー |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | ファイルツリー |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | ファジーファインダー |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | シンタックスハイライト |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 設定 |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | 補完エンジン |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | スニペット |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | 括弧の自動補完 |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git 差分表示 |
| [coc.nvim](https://github.com/neoclide/coc.nvim) | LSP クライアント (別系統) |
| [copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot |

