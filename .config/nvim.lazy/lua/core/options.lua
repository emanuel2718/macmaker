local fn = vim.fn
local opt = vim.opt
local wo = vim.wo

opt.backup = false
opt.cmdheight = 1
-- opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
opt.cursorline = true
-- opt.lazyredraw = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showmode = false
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.foldlevel = 99
opt.foldmethod = "indent"
opt.foldenable = true
opt.termguicolors = true
---- opt.signcolumn = 'yes'
opt.swapfile = false
opt.textwidth = 79
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.undolevels = 10000
opt.undoreload = 10000
opt.updatetime = 300
opt.wildignore = "*.swp, *.bak, *.pyc, *.class"
opt.splitbelow = true
opt.splitright = true
opt.encoding = "utf-8"
opt.errorbells = false
opt.wrap = false
opt.pumheight = 8
opt.pumblend = 10

-- Set copilots options here. TODO: move this
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.copilot_node_command = "$HOME/.nvm/versions/node/v16.15.0/bin/node"
-- TODO: add keybind to not show copilot on comments
vim.api.nvim_set_keymap(
  "i",
  "<C-p>",
  "copilot#Accept()",
  { expr = true, silent = true }
)
