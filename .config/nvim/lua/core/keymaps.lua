local opts = { noremap = true, silent = true }
local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Split windows
map("n", "<leader>wv", ":vsplit<cr>", opts)
map("n", "<leader>ws", ":split<cr>", opts)

-- Emacs window movement
map("n", "<leader>wh", "<C-w>h", opts)
map("n", "<leader>wj", "<C-w>j", opts)
map("n", "<leader>wk", "<C-w>k", opts)
map("n", "<leader>wl", "<C-w>l", opts)

-- Window resizing
map("n", "<C-Up>", ":resize +2<cr>", opts)
map("n", "<C-Down>", ":resize -2<cr>", opts)
map("n", "<C-Left>", ":vertical resize +2<cr>", opts)
map("n", "<C-Right>", ":vertical resize -2<cr>", opts)

map("n", "<leader>bd", ":Bdelete", opts)

map("n", "<leader>wd", ":q<cr>", opts)
map("n", "<leader>qq", ":qa!<cr>", opts)
map("n", "<leader>q", ":q!<cr>", opts)
map("n", "<leader>fs", ":w<cr>", opts)
map("n", "<leader>`", ":b#<cr>", opts) -- switch to last buffer
map("n", "<leader><leader>", ":noh <cr>", opts) -- clear search highlights

-- Source lua file
map("n", "%%", ":so%<cr>")

-- deal with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- move highlighted lines up and down
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- <C-d> and <C-u> scroll but keep cursor in the middle
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Multiple indent commands
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- respect system clipboard unless told otherwise
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- Q, please don't do random shit
map("n", "Q", "<nop>")

-- Search and replace for current word
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Print current directory
map("n", "<leader>pw", ":!pwd<cr>")

map("n", "<C-\\>", ":ToggleTerm<cr>")

-- Cargo commands
-- map('n', '<leader>cb', ':!cargo build<cr>')
-- map('n', '<leader>ct', ':!cargo test<cr>')
-- map('n', '<leader>cr', ':!cargo run<cr>')
