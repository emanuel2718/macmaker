local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Leader as <Space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Split windows
map('n', '<leader>wv', ':vsplit<cr>')
map('n', '<leader>ws', ':split<cr>')

-- Emacs window movement
map('n', '<leader>wh', '<C-w>h')
map('n', '<leader>wj', '<C-w>j')
map('n', '<leader>wk', '<C-w>k')
map('n', '<leader>wl', '<C-w>l')


-- Window resizing
map('n', '<C-Up>', ':resize +2<cr>')
map('n', '<C-Down>', ':resize -2<cr>')
map('n', '<C-Left>', ':vertical resize +2<cr>')
map('n', '<C-Right>', ':vertical resize -2<cr>')


map('n', '<leader>wd', ':q<cr>', { silent = true })
map('n', '<leader>qq', ':qa!<cr>', { silent = true })
map('n', '<leader>q', ':q!<cr>', { silent = true })
map('n', '<leader>fs', ':w<cr>', { silent = true })
map('n', '<leader>`', ':b#<cr>', { silent = true }) -- switch to last buffer
map('n', '<leader><leader>', ':noh <cr>', { silent = true }) -- clear search highlights

-- Source lua file
map('n', '%%', ':so%<cr>')

-- <Space> do nothing on normal mode and visual mode
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- deal with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- move highlighted lines up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- <C-d> and <C-u> scroll but keep cursor in the middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- respect system clipboard unless told otherwise
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- Q, please don't do random shit
map("n", "Q", "<nop>")

-- Is this the Emacs Projectile replacement I was looking for?!
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quickfix navigation
map("n", "<C-k>", ":cnext<CR>zz")
map("n", "<C-j>", ":cprev<CR>zz")
map("n", "<leader>k", ":lnext<CR>zz")
map("n", "<leader>j", ":lprev<CR>zz")

-- Search and replace for current word
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Print current directory
map('n', '<leader>pw', ':!pwd<cr>')

-- Cargo commands
map('n', '<leader>cb', ':!cargo build<cr>')
map('n', '<leader>ct', ':!cargo test<cr>')
map('n', '<leader>cr', ':!cargo run<cr>')

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<cr>')

-- Telescope
map('n', '<leader>.', ':Telescope find_files<cr>')
map('n', '<leader>pf', ':Telescope git_files<cr>')
map('n', '<leader>fr', ':Telescope oldfiles<cr>')
map('n', '<leader>s.', ':Telescope grep_string<cr>')
map('n', '<leader>sp', ':Telescope live_grep<cr>')
map('n', '<leader>ss', ':Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>sd', ':Telescope diagnostics<cr>')
map('n', '<leader>ht', ':Telescope colorscheme<cr>')


-- Toggle Diagnostics
-- map('n', '<leader>dd', ':ToggleDiag<cr>')


-- Random Plugins keymaps
-- map('n', '<leader>ps', ':PackerSync<cr>')
map('n', '<leader>ps', ':Lazy<cr>')
map('n', '<leader>u', ':UndotreeToggle<cr>')
map('n', '<leader>md', ':MarkdownPreviewToggle<cr>')
map('n', '<leader>gg', ':Neogit<cr>')
-- map('n', '<leader>gg', ':LazyGit<cr>')


-- Avoid moving lines by mistake
map('n', '<S-j>', '<Nop>')
map('n', '<S-k>', '<Nop>')



