local keymap = vim.keymap.set

-- Leader as <Space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


--------- Default keymaps ---------

-- Emacs window movement
keymap('n', '<leader>wh', '<C-w>h')
keymap('n', '<leader>wj', '<C-w>j')
keymap('n', '<leader>wk', '<C-w>k')
keymap('n', '<leader>wl', '<C-w>l')

-- Split windows
keymap('n', '<leader>wv', ':vsplit<cr>')
keymap('n', '<leader>ws', ':split<cr>')

keymap('n', '<leader>wd', '<cmd>q<cr>', { silent = true })
keymap('n', '<leader>qq', '<cmd>qa!<cr>')
keymap('n', '<leader>fs', '<cmd>w<cr>')
keymap('n', '<leader>`', '<cmd>b#<cr>', { silent = true }) -- switch to last buffer
keymap('n', '=', '<cmd> resize +1 <cr>') -- resize up
keymap('n', '-', '<cmd> resize -1 <cr>') -- resize down
keymap('n', '<leader><leader>', '<cmd> noh <cr>', { silent = true }) -- clear search highlights


-- <Space> do nothing on normal mode and visual mode
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- deal with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- move highlighted lines up and down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- move line up and keep cursor position
keymap("n", "J", "mzJ`z")

-- <C-d> and <C-u> scroll but keep cursor in the middle
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")


-- keep cursor in the middle when searching
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")



-- respect system clipboard unless told otherwise
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

-- Q don't do random shit
keymap("n", "Q", "<nop>")
-- Is this the projectile replacement i was looking for?
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


-- Quickfix navigation
keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace for current word
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Cargo commands
keymap('n', '<leader>cb', '<cmd>!cargo build<cr>')
keymap('n', '<leader>ct', '<cmd>!cargo test<cr>')
keymap('n', '<leader>cr', '<cmd>!cargo run<cr>')





--------- Plugin keymaps ---------

-- NvimTree
keymap('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
keymap('n', '<leader>br', '<cmd>NvimTreeRefresh<cr>')

-- Git Neogit
keymap('n', '<leader>gg', '<cmd>Neogit<cr>') -- neogit


-- Github Copilot
keymap('n', '<leader>g.', "<cmd>Copilot enable<cr>")
keymap('n', '<leader>gk', "<cmd>Copilot disable<cr>")


-- UndoTree
keymap('n', '<leader>u', '<cmd>UndotreeToggle<cr>')

-- Packer
keymap('n', '<leader>ps', '<cmd>PackerSync <cr>')
keymap('n', '<leader>pi', '<cmd>PackerInstall <cr>')

-- Gitsigns
keymap('n', '<leader>gl', "<cmd>lua require 'gitsigns'.blame_line()<cr>")



-- Telescope
local builtin = require('telescope.builtin')
keymap('n', '<leader>pf', builtin.git_files)
keymap('n', '<leader>fr', builtin.oldfiles)
keymap('n', '<leader>.', builtin.find_files)
keymap('n', '<leader>s.', builtin.grep_string)
keymap('n', '<leader>sp', builtin.live_grep)
keymap('n', '<leader>ss', builtin.current_buffer_fuzzy_find)
-- keymap('n', '<leader>/', builtin.current_buffer_fuzzy_find(theme.get_dropdown { winblend = 10, peviewer = false }))
keymap('n', '<leader>sd', builtin.diagnostics)
keymap('n', '<leader>ht', builtin.colorscheme)
keymap('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })


-- Zen mode
keymap('n', '<leader>zz', require('zen-mode').toggle)



-- LSP
local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end
  keymap('n', keys, func)
end
keymap('n', '<leader>lc', '<cmd>LspRestart <cr>')
keymap('n', '<Leader>dd', '<cmd>ToggleDiag <cr>')
keymap('n', 'dp', vim.diagnostic.goto_prev)
keymap('n', 'dn', vim.diagnostic.goto_next)
keymap('n', '<leader>i', vim.diagnostic.open_float)
keymap('n', '<leader>ll', vim.diagnostic.setloclist)
nmap('<leader>rr', vim.lsp.buf.rename)
nmap('<leader>f', vim.lsp.buf.format)
nmap('<leader>ca', vim.lsp.buf.code_action)
nmap('<leader>gd', vim.lsp.buf.definition)
nmap('<leader>gD', vim.lsp.buf.declaration)
nmap('<leader>gi', vim.lsp.buf.implementation)
nmap('<leader>D', vim.lsp.buf.type_definition)
nmap('K', vim.lsp.buf.hover)
nmap('<C-K>', vim.lsp.buf.signature_help)
nmap('<leader>gr', builtin.lsp_references)
nmap('<leader>si', builtin.lsp_document_symbols)
nmap('<leader>sw', builtin.lsp_dynamic_workspace_symbols)

nmap('<leader>wa', vim.lsp.buf.add_workspace_folder)
nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder)
