return {
  "nvim-telescope/telescope.nvim",
  branch = '0.1.x',
  module = 'telescope',
  cmd = "Telescope",
  dependencies = {
    {
      'nvim-lua/plenary.nvim',
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = ":make",
    }
  },
  config = function()
    local telescope = require "telescope"

    local actions = require "telescope.actions"

    local pickers = {
      oldfiles = {
        prompt_title = "Recent Files",
      },
      find_files = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      }
    }

    local extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
      },
    }
    telescope.setup {
      defaults = {
        layout_config = {
          width = 0.8,
          prompt_position = "bottom",
          preview_cutoff = 100,
        },
        -- layout_strategy = "horizontal",
        winblend = 0,
        selection_strategy = "reset",
        -- sorting_strategy = "ascending",
        prompt_prefix = " ",
        selection_caret = "ﰲ ",
        path_display = { "truncate" },
        file_ignore_patterns = { ".git/", "node_modules" },

        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<esc>"] = actions.close,
          },
          n = {
            ["<esc>"] = actions.close,
          },
        },
      },
      pickers = pickers,
      extensions = extensions,
    }

    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    pcall(telescope.load_extension, 'fzf')
  end,
}
