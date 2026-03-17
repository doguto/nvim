return {
  'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { ';t', '<cmd>Telescope find_files<cr>', desc = 'ファイル検索' },
    { ';f', '<cmd>Telescope live_grep<cr>', desc = 'ファイル内検索' },
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({})
    telescope.load_extension('fzf')
  end,
}
