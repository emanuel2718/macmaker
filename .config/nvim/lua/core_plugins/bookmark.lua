local map = vim.keymap.set

map('n', 'ma', '<cmd>lua require("telescope").extensions.vim_bookmarks.all()<cr>')
map('n', 'mn', '<cmd>lua require("telescope").extensions.vim_bookmarks.current_file()<cr>')