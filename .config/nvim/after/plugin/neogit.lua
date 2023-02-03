local neogit = require("neogit")
local map = vim.keymap.set

neogit.setup({})

map('n', '<leader>gg', ':Neogit<CR>')
