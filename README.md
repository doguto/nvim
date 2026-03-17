# Neovim 設定

## キーマップ一覧

> `<Leader>` = `Space`

### ファイル操作 (telescope.nvim)

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `;t` | Normal | ファイル検索 (find_files) | `lua/plugins/telescope.lua` |
| `;f` | Normal | ファイル内検索 (live_grep) | `lua/plugins/telescope.lua` |

### ファイルツリー (nvim-tree)

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `;h` | Normal | NvimTree にフォーカス | `lua/plugins/nvim-tree.lua` |

### タブ操作 (barbar.nvim)

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `<Tab>` | Normal | 次のバッファへ | `lua/plugins/barbar.lua` |
| `<S-Tab>` | Normal | 前のバッファへ | `lua/plugins/barbar.lua` |
| `;w` | Normal | バッファを閉じる | `lua/plugins/barbar.lua` |

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
