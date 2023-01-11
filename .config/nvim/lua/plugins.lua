vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }


  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable 'make' == 1
  }
  use 'nvim-telescope/telescope-ui-select.nvim'

  -- Neodev
  use 'folke/neodev.nvim'

  -- Completions
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'

  -- Formatter
  use 'mhartington/formatter.nvim'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Lsp Helpers
  use 'jose-elias-alvarez/typescript.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'windwp/nvim-ts-autotag'
  -- use 'p00f/nvim-ts-rainbow'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use {
    'nvim-treesitter/nvim-treesitter-refactor',
    after = 'nvim-treesitter',
  }
  use 'nvim-treesitter/playground'

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'
  -- use 'kdheepak/lazygit.nvim'
  use 'f-person/git-blame.nvim'
  use 'tpope/vim-obsession'
  use 'dhruvasagar/vim-prosession'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' } -- neogit

  -- Copilot
  use('github/copilot.vim')

  -- UndoTree
  use {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
  }


  -- Diagnostics
  use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'

  -- Vim Bookmarks
  use 'MattesGroeger/vim-bookmarks'
  use 'tom-anders/telescope-vim-bookmarks.nvim'


  -- NvimTree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  -- Misc
  use 'j-hui/fidget.nvim'
  use 'tpope/vim-surround'
  -- use 'echasnovski/mini.nvim'
  use 'windwp/nvim-autopairs'
  use 'gcmt/wildfire.vim'
  use 'mg979/vim-visual-multi'
  use 'kyazdani42/nvim-web-devicons'
  use 'folke/todo-comments.nvim'
  use 'numToStr/Comment.nvim'
  use {
    'akinsho/toggleterm.nvim',
    tag = '*'
  }
  use({
    'kana/vim-textobj-user',
    {
      'kana/vim-textobj-entire',
      'Julian/vim-textobj-variable-segment',
    },
  })



  -- Experimental
  use 'axelvc/template-string.nvim'
  -- use {
  --   "luukvbaal/nnn.nvim",
  --   config = function() require("nnn").setup() end
  -- }


  -- Themes
  use 'sainnhe/everforest'
  use 'sainnhe/sonokai'
  use 'sainnhe/gruvbox-material'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'folke/tokyonight.nvim'
  use 'tomasiser/vim-code-dark'
  use 'marko-cerovac/material.nvim'
  use 'EdenEast/nightfox.nvim'


end)
