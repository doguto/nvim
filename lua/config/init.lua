-- 基本設定
vim.opt.number = true          -- 行番号を表示
vim.opt.relativenumber = true  -- 相対行番号を表示
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus" -- クリップボードを共有

vim.g.mapleader = " "

-- .lua ファイルのインデントを半角スペース2つに統一
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

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

-- ジャンプリスト移動
vim.keymap.set("n", ";a", "<C-o>", { noremap = true, silent = true, desc = "ジャンプリスト: 前へ" })
vim.keymap.set("n", ";d", "<C-i>", { noremap = true, silent = true, desc = "ジャンプリスト: 次へ" })

-- 残りの設定ファイルの読み込み
require("lazy").setup({
  { import = "plugins.ui" },
  { import = "plugins.tools" },
  { import = "plugins.coding" },
})

