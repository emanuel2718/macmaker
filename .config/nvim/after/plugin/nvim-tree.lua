require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_buffer_on_setup = false,
  ignore_ft_on_setup = {},
  auto_reload_on_write = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = true,
    custom = {},
  },
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    mappings = {
      custom_only = false,
      list = {
        -- disable c-h
        { key = "<C-h>", cb = "<Nop>" },
        { key = "<C-j>", cb = "<Nop>" },
        { key = "<C-k>", cb = "<Nop>" },
        { key = "<C-l>", cb = "<Nop>" },
        { key = "h", cb = "<Nop>" },

        -- { key = '<C-h>', action = 'dir_up' },
        { key = 'l', action = '<CR>' },
        { key = 'h', action = 'close_node' },
        { key = 'H', action = 'toggle_dotfiles' }

      }
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
})

local map = vim.keymap.set
map('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
