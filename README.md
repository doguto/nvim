# Neovim 設定

## キーマップ一覧

> `<Leader>` = `Space`

### ファイル操作 (telescope.nvim)

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `;t` | Normal | ファイル検索 (find_files) | `lua/plugins/telescope.lua` |
| `;f` | Normal | ファイル内検索 (live_grep) | `lua/plugins/telescope.lua` |

### ファイルツリー (neo-tree.nvim)

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `;h` | Normal | Neo-tree にフォーカス | `lua/plugins/ui/neo-tree.lua` |

### コメント操作 (Comment.nvim)

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `g/` | Normal | 現在行のコメント切替 | `lua/plugins/tools/comment.lua` |
| `g/` | Visual | 選択範囲のコメント切替 | `lua/plugins/tools/comment.lua` |

### カラーコードプレビュー (nvim-colorizer.lua)

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `;c` | Normal | カラーコード表示トグル | `lua/plugins/ui/colorizer.lua` |

### ジャンプ移動

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `;a` | Normal | ジャンプリストを前へ戻る (`<C-o>`) | `lua/config/init.lua` |
| `;d` | Normal | ジャンプリストを次へ進む (`<C-i>`) | `lua/config/init.lua` |

### LSP (nvim-lspconfig)

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `gd` | Normal | 定義へジャンプ | `lua/config/lsp.lua` |
| `gr` | Normal | シンボルのリネーム | `lua/config/lsp.lua` |

### 補完操作 (nvim-cmp)

| キー | モード | 動作 | 設定ファイル |
|------|--------|------|-------------|
| `<C-y>` | Insert | 補完候補を確定 | `lua/plugins/coding/nvim-cmp.lua` |
| `<C-e>` | Insert | 補完を閉じる | `lua/plugins/coding/nvim-cmp.lua` |
| `<C-n>` | Insert | 次の候補へ | `lua/plugins/coding/nvim-cmp.lua` |
| `<C-p>` | Insert | 前の候補へ | `lua/plugins/coding/nvim-cmp.lua` |

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
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | `coding` | HTML/JSXタグの自動補完 |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | `tools` | コメントのトグル操作 |
| [copilot.vim](https://github.com/github/copilot.vim) | `tools` | GitHub Copilot |
| [git.nvim](https://github.com/dinhhuy258/git.nvim) | `tools` | Git 操作の統合 |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | `tools` | Git 差分表示 |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | `tools` | 括弧の自動補完 |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | `tools` | ファジーファインダー |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | `tools` | キーバインドヘルプ表示 |
| [barbar.nvim](https://github.com/romgrk/barbar.nvim) | `ui` | タブバー |
| [catppuccin](https://github.com/catppuccin/nvim) | `ui` | カラースキーム |
| [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) | `ui` | カラーコードのプレビュー表示 |
| [hlchunk.nvim](https://github.com/shellRaining/hlchunk.nvim) | `ui` | インデントガイドの可視化 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | `ui` | ステータスライン |
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | `ui` | Markdown のインラインレンダリング |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | `ui` | ファイルツリー |
