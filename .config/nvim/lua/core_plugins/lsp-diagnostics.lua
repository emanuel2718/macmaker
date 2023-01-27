local map = vim.keymap.set

require 'toggle_lsp_diagnostics'.init({ start_on = false })

map('n', '<leader>dd', '<cmd>ToggleDiag<cr>')
