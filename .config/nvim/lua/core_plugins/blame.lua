local map = vim.keymap.set

vim.g.gitblame_enabled = 0
vim.g.gitblame_date_format = '%r'
vim.g.gitblame_message_template = '    <author> • <date> • <summary>'

map('n', '<leader>gl', ':GitBlameToggle<cr>')
