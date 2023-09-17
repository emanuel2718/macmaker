return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Power telescope with FZF
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-rg.nvim",           lazy = true },
    { "nvim-telescope/telescope-node-modules.nvim", lazy = true },
    { "smartpde/telescope-recent-files",            lazy = true },
  },
  config = function()
    require("telescope").setup({
      pickers = {
        colorscheme = {
          enable_preview = false,
        },
      },
      defaults = {
        -- prompt_prefix = '🔍 ',
        prompt_prefix = "   ",

        selection_caret = "> ",
        file_ignore_patterns = {
          ".git/",
          "node_modules",
          "*-lock.yaml",
          "env/",
        },
        dynamic_preview_title = true,
        vimgrep_arguments = {
          "rg",
          "--ignore",
          "--hidden",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },
        mappings = {
          i = {
            ["<C-x>"] = false,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<esc>"] = require("telescope.actions").close,
          },
          n = {
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["v"] = require("telescope.actions").file_vsplit,
            ["s"] = require("telescope.actions").file_split,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("node_modules")
  end,
  enabled = true,
}

-- return { {
--   -- Telescope
--   -- Find, Filter, Preview, Pick. All lua, all the time.
--   "nvim-telescope/telescope.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     {
--       "nvim-telescope/telescope-fzf-native.nvim",
--       build = "make"
--     },
--     { "nvim-telescope/telescope-rg.nvim",           lazy = true },
--     { "nvim-telescope/telescope-node-modules.nvim", lazy = true },
--   },
--   config = function(_)
--     require("telescope").setup({
--       pickers = {
--         colorscheme = {
--           enable_preview = true
--         }
--       },
--       defaults = {
--         file_ignore_patterns = {
--           ".git/",
--           "node_modules",
--           "*-lock.yaml",
--           "env/",
--         },
--         vimgrep_arguments = {
--           "rg",
--           "--ignore",
--           "--hidden",
--           "--color=never",
--           "--no-heading",
--           "--with-filename",
--           "--line-number",
--           "--column",
--           "--smart-case",
--           "--trim",
--         },
--       },
--       mappings = {
--         i = {
--           ["<C-x>"] = false,
--           ["<C-k>"] = require("telescope.actions").move_selection_previous,
--           ["<C-j>"] = require("telescope.actions").move_selection_next,
--           ["<esc>"] = require("telescope.actions").close,
--         },
--         n = {
--           ["<C-k>"] = require("telescope.actions").move_selection_previous,
--           ["<C-j>"] = require("telescope.actions").move_selection_next,
--           ["v"] = require("telescope.actions").file_vsplit,
--           ["s"] = require("telescope.actions").file_split,
--         },
--       },
--       extensions = {
--         fzf = {
--           fuzzy = true,
--           override_generic_sorter = true,
--           override_file_sorter = true,
--           case_mode = "smart_case",
--         },
--       },
--     })
--     -- To get fzf loaded and working with telescope, you need to call
--     -- load_extension, somewhere after setup function:
--     require("telescope").load_extension("fzf")
--     require("telescope").load_extension("node_modules")
--   end
-- } }
