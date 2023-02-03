vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  -- LSP and Autocompletion Stuff
  use('onsails/lspkind-nvim') -- vscode-like pictograms
  use('hrsh7th/cmp-nvim-lsp') -- nvim-cmp source for neovim's built-in LSP
  use('neovim/nvim-lspconfig') -- LSP
  use('hrsh7th/nvim-cmp') -- Completion
  -- use({
  --   'glepnir/lspsaga.nvim',
  --   branch = 'main',
  --   config = function()
  --     require('lspsaga').setup({})
  --   end,
  --   requires = { { 'nvim-tree/nvim-web-devicons' } },
  -- })
  use('L3MON4D3/LuaSnip')
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })

  use({
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'rafamadriz/friendly-snippets',
    },
  })

  -- Diagnostics
  use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'

  -- Formatting
  use('jose-elias-alvarez/null-ls.nvim')

  -- Ui
  use('nvim-lualine/lualine.nvim')

  -- File Manager
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly',
  })

  -- Experimental
  use('akinsho/nvim-bufferline.lua')

  -- Tools
  use('numToStr/Comment.nvim')
  use('kylechui/nvim-surround')
  use('JoosepAlviste/nvim-ts-context-commentstring')
  use('mbbill/undotree')
  use({ 'David-Kunz/treesitter-unit', after = 'nvim-treesitter' })

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })
  use({
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable('make') == 1,
  })

  use('nvim-telescope/telescope-ui-select.nvim')

  -- ToggleTerm
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  use('windwp/nvim-autopairs')
  use('windwp/nvim-ts-autotag')
  use('norcalli/nvim-colorizer.lua')
  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  })

  -- Git
  use('TimUntersberger/neogit')
  use('lewis6991/gitsigns.nvim')
  use('f-person/git-blame.nvim')

  -- Appearance
  use('kyazdani42/nvim-web-devicons')

  -- Buffer Management
  use('ojroques/nvim-bufdel')

  -- GX
  use('stsewd/gx-extended.vim')

  -- Copilot
  use('github/copilot.vim')

  -- Themes
  use({
    "neanias/everforest-nvim",
  })
  use { 'srcery-colors/srcery-vim', as = 'srcery' }
  use 'NLKNguyen/papercolor-theme'
  use 'Mofiqul/vscode.nvim'
  use "Alexis12119/nightly.nvim"
  use 'folke/tokyonight.nvim'
  use "EdenEast/nightfox.nvim"
  use 'sainnhe/gruvbox-material'
  use 'aktersnurra/no-clown-fiesta.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
  })
  use {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim"
  }
end)
