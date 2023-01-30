return {
  'nvim-treesitter/nvim-treesitter',
  module = true,
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = {
    'TSInstall',
    'TSInstallInfo',
    'TSUpdate',
    'TSBufEnable',
    'TSBufDisable',
    'TSEnable',
    'TSDisable',
    'TSModuleInfo',
  },
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  -- build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'c',
        'cpp',
        'lua',
        'go',
        'python',
        'java',
        'fish',
        'javascript',
        'typescript',
        'tsx',
        'json',
        'jsonc',
        'markdown',
        'markdown_inline',
        'rust',
        'toml',
        'yaml',
      }, -- one of "all" or a list of languages
      highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
        disable = function(_, bufnr)
          return vim.api.nvim_buf_line_count(bufnr) > 10000 -- disable on large files
              or vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]:len() > 500 -- or files w/ very long lines
        end,
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = false, disable = {} },
    })
  end,
}
