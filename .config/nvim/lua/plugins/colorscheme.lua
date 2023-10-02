return {
  -- Nightfly
  {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.g.nightflyItalics = false
      -- vim.cmd([[colorscheme nightfly]])
    end,
  },
  -- TokyoNight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd([[colorscheme tokyonight]])
    end,
  },
  -- Gruvbox Material
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    priority = 1000,
    config = function()
      -- vim.o.background = "dark"
      -- vim.g.gruvbox_material_background = "hard"
      -- vim.g.gruvbox_material_transparent_background = 1
      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  -- Modus
  {
    "ishan9299/modus-theme-vim",
    config = function()
      -- vim.cmd.colorscheme("modus-vivendi") -- dark
      -- vim.cmd.colorscheme("modus-operandi") -- light
    end,
  },
  {
    "ramojus/mellifluous.nvim",
    config = function()
      require("mellifluous").setup({ --[[...]]
      }) -- optional, see configuration section.
      -- vim.cmd.colorscheme("mellifluous")
    end,
  },
  {
    "dasupradyumna/midnight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("midnight")
    end,
  },
  {
    "felipeagc/fleet-theme-nvim",
    config = function()
      -- vim.cmd.colorscheme("fleet")
    end,
  },
  {
    "roobert/nightshift.vim",
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      -- vim.cmd.colorscheme("nightshift")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = false,  -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = false },
      functionStyle = {},
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      typeStyle = {},
      transparent = false,   -- do not set background color
      dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {             -- add/modify theme and palette colors
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "wave",    -- Load "wave" theme when 'background' option is not set
      background = {     -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
      },
    },
    config = function()
      -- vim.cmd.colorscheme("kanagawa-dragon")
    end,
  },
  {
    "behemothbucket/dirty-ice-theme.nvim",
    config = function()
      -- require("dirty-ice").setup()
      -- vim.cmd.colorscheme()
    end,
  },
  {
    "blazkowolf/gruber-darker.nvim",
    opts = {
      bold = false,
      italic = {
        strings = false,
      },
    },
    config = function()
      -- vim.cmd.colorscheme("gruber-darker")
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      -- vim.opt.background = "dark" -- set this to dark or light
      -- vim.cmd.colorscheme("oxocarbon")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      -- vim.cmd.colorscheme("carbonfox")
    end,
  },
  {
    'fenetikm/falcon',
    config = function()
    end
  },
  {
    'ishan9299/nvim-solarized-lua',
    config = function()
      vim.g.solarized_italics = 0
    end
  }
}
