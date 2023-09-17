return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opt = true
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    end

    require("nvim-tree").setup({
      on_attach = my_on_attach,
      filters = {
        dotfiles = false
      },

      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = true,
      hijack_directories = {
        enable = true,
        auto_open = false,
      },
      update_focused_file = {
        enable = true,
        update_root = false
      },
      view = {
        adaptive_size = false,
        side = "right",
        width = 30,
        preserve_window_proportions = true,
      },
      git = {
        enable = false,
        ignore = true
      },
      filesystem_watchers = {
        enable = true
      },
      actions = {
        open_file = {
          resize_window = true
        }
      },
      renderer = {
        root_folder_label = false,
        highlight_git = false,
        highlight_opened_files = "none",

        indent_markers = {
          enable = false
        },
      }

    })
  end
}
