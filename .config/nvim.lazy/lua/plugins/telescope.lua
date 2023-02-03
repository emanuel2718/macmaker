local M = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope", "Tel" },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "folke/trouble.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  lazy = true,
}

function M.config()
  local trouble = require("trouble.providers.telescope")
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local borderless = true

  telescope.setup({
    defaults = {
      -- layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "bottom",
      },
      -- sorting_strategy = "ascending",
      mappings = {
        i = {
          ["<c-t>"] = trouble.open_with_trouble,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<esc>"] = actions.close,
        },
        n = {
          ["<esc>"] = actions.close,
        },
      },
      -- mappings = { i = { ["<esc>"] = actions.close } },
      -- vimgrep_arguments = {
      --   'rg',
      --   '--color=never',
      --   '--no-heading',
      --   '--with-filename',
      --   '--line-number',
      --   '--column',
      --   '--smart-case'
      -- },
      -- prompt_position = "bottom",
      -- prompt_prefix = " ",
      -- selection_caret = " ",
      -- entry_prefix = "  ",
      -- initial_mode = "insert",
      -- selection_strategy = "reset",
      -- sorting_strategy = "descending",
      -- layout_strategy = "horizontal",
      -- layout_defaults = {
      --   horizontal = {
      --     mirror = false,
      --   },
      --   vertical = {
      --     mirror = false,
      --   },
      -- },
      -- file_sorter = require"telescope.sorters".get_fzy_file
      -- file_ignore_patterns = {},
      -- generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
      -- shorten_path = true,
      winblend = borderless and 0 or 10,
      -- width = 0.7,
      -- preview_cutoff = 120,
      -- results_height = 1,
      -- results_width = 0.8,
      -- border = false,
      -- color_devicons = true,
      -- use_less = true,
      -- set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      -- file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      -- grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      -- qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

      -- -- Developer configurations: Not meant for general override
      -- buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
    pickers = {
      colorscheme = {
        enable_preview = true,
      },
    },
  })
  pcall(telescope.load_extension, "fzf")
end

M.keys = {
  {
    "<leader>.",
    function()
      require("telescope.builtin").find_files({ only_cwd = true })
    end,
    { desc = "Find all files (including untracked)" },
  },
  {
    "<leader>f",
    require("core/utils").project_files,
    { desc = "Find Tracked Project Files" },
  },
  -- { "<leader>w", require("core/utils").compact_browser, { desc = "Browse Files" }},
  {
    "<leader>fr",
    function()
      require("telescope.builtin").oldfiles({ only_cwd = true })
    end,
    { desc = "Old Files" },
  },
  {
    "<leader>sp",
    function()
      require("telescope.builtin").live_grep()
    end,
    { desc = "Grep Files" },
  },
  {
    "<leader>s.",
    function()
      require("telescope.builtin").grep_string()
    end,
    { desc = "Grep String in file." },
  },
  {
    "<leader>bi",
    function()
      require("telescope.builtin").buffers()
    end,
    { desc = "Find Buffers" },
  },
  {
    "<leader>hh",
    function()
      require("telescope.builtin").help_tags()
    end,
    { desc = "Find Help Tags" },
  },
  {
    "<leader>ht",
    function()
      require("telescope.builtin").colorscheme()
    end,
    { desc = "Colorscheme" },
  },
  {
    "<leader>k",
    function()
      require("telescope.builtin").keymaps()
    end,
    { desc = "Find Keymaps" },
  },
  {
    "<leader>sd",
    function()
      require("telescope.builtin").diagnostics()
    end,
    { desc = "View LSP diagnostics" },
  },
}

return M
