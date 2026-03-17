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

| プラグイン | カテゴリ | 用途 |
|-----------|----------|------|
| [coc.nvim](https://github.com/neoclide/coc.nvim) | `coding` | LSP クライアント (別系統) |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | `coding` | 補完エンジン |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | `coding` | LSP 設定 |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | `coding` | シンタックスハイライト |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | `tools` | コメントのトグル操作 |
| [copilot.vim](https://github.com/github/copilot.vim) | `tools` | GitHub Copilot |
| [git.nvim](https://github.com/dinhhuy258/git.nvim) | `tools` | Git 操作の統合 |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | `tools` | Git 差分表示 |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | `tools` | 括弧の自動補完 |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | `tools` | ファジーファインダー |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | `tools` | キーバインドヘルプ表示 |
| [barbar.nvim](https://github.com/romgrk/barbar.nvim) | `ui` | タブバー |
| [catppuccin](https://github.com/catppuccin/nvim) | `ui` | カラースキーム |
| [hlchunk.nvim](https://github.com/shellRaining/hlchunk.nvim) | `ui` | インデントガイドの可視化 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | `ui` | ステータスライン |
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | `ui` | Markdown のインラインレンダリング |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | `ui` | ファイルツリー |
