return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {},
  version = '^1.0.0',
  config = function(_, opts)
    require('barbar').setup(opts)

    local map = vim.keymap.set
    -- タブ移動
    map('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
    map('n', '<A-.>', '<Cmd>BufferNext<CR>')
    -- タブを閉じる
    map('n', '<A-c>', '<Cmd>BufferClose<CR>')
    -- タブを番号で移動
    map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
    map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
    map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
    map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
    map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
  end,
}
