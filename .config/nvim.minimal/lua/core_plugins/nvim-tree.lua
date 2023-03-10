local map = vim.keymap.set

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  actions = {
    open_file = { quit_on_open = true }
  },
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  filters = {
    custom = { '^.git$', '^node_modules$', "^.build$", ".vscode" }
  },
  git = {
    enable = false
  },
  log = {
    enable = true,
    types = {
      diagnostics = true
    }
  },
  view = {
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
    }
  }
})

map('n', '<leader>e', ':NvimTreeToggle<cr>')
map('n', '<leader>E', ':NvimTreeFindFile<cr>')
