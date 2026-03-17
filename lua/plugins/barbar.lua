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
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', ';w', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })
  end,
}
