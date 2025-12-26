-- 基本設定
vim.opt.number = true          -- 行番号を表示
vim.opt.relativenumber = true  -- 相対行番号を表示
vim.opt.termguicolors = true

-- キーマップの例（最低限）
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- プラグインマネージャ lazy.nvim のセットアップ
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	signs = false,
	update_in_insert = false,
	severity_sort = true,
})

-- 残りの設定ファイルの読み込み
require("lazy").setup({
  { import = "plugins" },
})

