local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local map = vim.keymap.set


require('telescope').setup {
  extensions = {
    fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true },
  },
  defaults = {
    path_display = { 'truncate' },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<esc>"] = actions.close
      }
    }
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6
    }
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
    lsp_references = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_definitions = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_declarations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_implementations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
  },
}
require("telescope").load_extension("ui-select")

map('n', '<leader>.', builtin.find_files)
map('n', '<leader>pf', builtin.git_files)
map('n', '<leader>fr', builtin.oldfiles)
map('n', '<leader>s.', builtin.grep_string)
map('n', '<leader>sp', builtin.live_grep)
map('n', '<leader>ss', builtin.current_buffer_fuzzy_find)
map('n', '<leader>sd', builtin.diagnostics)
map('n', '<leader>ht', builtin.colorscheme)
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end)





-- require('telescope').setup({
--   pickers = {
--     find_files = {
--       theme = "dropdown",
--       hidden = true,
--       previewer = false,
--     },
--     oldfiles = {
--       hidden = true,
--       previewer = false,
--     },
--     diagnostics = {
--       theme = "dropdown",
--       previewer = false,
--     },
--     live_grep = {
--       --@usage don't include the filename in the search results
--       only_sort_text = true,
--       theme = "dropdown",
--     },
--     grep_string = {
--       only_sort_text = true,
--       theme = "dropdown",
--     },
--     buffers = {
--       theme = "dropdown",
--       previewer = false,
--       initial_mode = "normal",
--       mappings = {
--         i = {
--           ["<C-d>"] = actions.delete_buffer,
--         },
--         n = {
--           ["dd"] = actions.delete_buffer,
--         },
--       },
--     },
--     planets = {
--       show_pluto = true,
--       show_moon = true,
--     },
--     git_files = {
--       theme = "dropdown",
--       hidden = true,
--       previewer = false,
--       show_untracked = true,
--     },
--     lsp_references = {
--       theme = "dropdown",
--       initial_mode = "normal",
--     },
--     lsp_definitions = {
--       theme = "dropdown",
--       initial_mode = "normal",
--     },
--     lsp_declarations = {
--       theme = "dropdown",
--       initial_mode = "normal",
--     },
--     lsp_implementations = {
--       theme = "dropdown",
--       initial_mode = "normal",
--     },
--   },
--   defaults = {
--     file_sorter = require('telescope.sorters').get_fzy_sorter,
--     prompt_prefix = " ",
--     selection_caret = "> ",
--     path_display = { "truncate" },
--     -- file_ignore_patterns = { 'node_modules', 'git' },
--     file_previewer = require('telescope.previewers').vim_buffer_cat.new,
--     grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
--     qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
--     selection_strategy = "reset",
--     sorting_strategy = "descending",
--     layout_strategy = "horizontal",
--     layout_config = {
--       width = 0.75,
--       preview_cutoff = 120,
--       horizontal = {
--         preview_width = function(_, cols, _)
--           if cols < 120 then
--             return math.floor(cols * 0.5)
--           end
--           return math.floor(cols * 0.6)
--         end,
--         mirror = false,
--       },
--       vertical = { mirror = false },
--     },
--     file_ignore_patterns = { 'node_modules' },
--     winblend = 0,
--     border = {},
--     borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
--     color_devicons = true,
--     set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
--     vimgrep_arguments = {
--       "rg",
--       "--color=never",
--       "--no-heading",
--       "--with-filename",
--       "--line-number",
--       "--column",
--       "--smart-case",
--       "--hidden",
--       "--glob=!.git/",
--     },

--     mappings = {
--       i = {
--         ['<C-x>'] = false,
--         ['<C-q>'] = actions.send_to_qflist,
--         ['<C-j>'] = actions.move_selection_next,
--         ['<C-k>'] = actions.move_selection_previous,
--         ['<esc>'] = actions.close,
--         ['<C-/>'] = actions.which_key,
--         ["<c-d>"] = require("telescope.actions").delete_buffer,
--       },
--       n = {
--         ['<c-d>'] = require('telescope.actions').delete_buffer

--       }
--     },
--     extensions = {
--       fzf = {
--         fuzzy = true, -- false will only do exact matching
--         override_generic_sorter = true, -- override the generic sorter
--         override_file_sorter = true, -- override the file sorter
--         case_mode = "smart_case", -- or "ignore_case" or "respect_case"
--       },
--     },
--   },
-- })

pcall(require('telescope').load_extension, 'fzf')
