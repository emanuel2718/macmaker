vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
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

  -- LSP, Completion and Snippets
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  -- Formatter
  use 'mhartington/formatter.nvim'
  use "lukas-reineke/lsp-format.nvim"

  -- NvimTree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- Prisma support
  use "pantharshit00/vim-prisma"

  -- Comments
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'numToStr/Comment.nvim'

  -- Diagnostics
  use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'

  -- Autopairs
  use 'windwp/nvim-autopairs'

  -- GX
  use 'stsewd/gx-extended.vim'

  -- Markdown Preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- Statusline
  use 'windwp/windline.nvim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }

  -- Copilot
  use 'github/copilot.vim'

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'f-person/git-blame.nvim'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- Experimental
  use 'ggandor/lightspeed.nvim'
  -- TODO: investigate if this was what was causing the slowness
  --   use 'jose-elias-alvarez/typescript.nvim'
  --   use 'jose-elias-alvarez/null-ls.nvim'


  -- Themes
  use "Alexis12119/nightly.nvim"
  use 'folke/tokyonight.nvim'
  use 'nyoom-engineering/oxocarbon.nvim'
  use 'sainnhe/gruvbox-material'
  use 'aktersnurra/no-clown-fiesta.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'elvessousa/sobrio'

end)
