return {
  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = 'markdown',
  },
  {
    'dstein64/vim-startuptime',
    init = function()
      vim.g.startuptime_tries = 5
    end,
    cmd = 'StartupTime',
    dependencies = {
      'nvim-lualine/lualine.nvim', -- Just to fix stuck issue on vim-startuptime
    },
  },
  { 'stsewd/gx-extended.vim' },
  { 'TimUntersberger/neogit' },
}
