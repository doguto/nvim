return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup({
      ensure_installed = {
        'lua', 'vim', 'vimdoc',
        'javascript', 'typescript', 'tsx',
        'python', 'rust', 'go', 'ruby', 'c_sharp',
        'html', 'css', 'json', 'yaml', 'toml', 'xml',
        'markdown', 'markdown_inline',
        'bash',
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
