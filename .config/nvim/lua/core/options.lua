local fn = vim.fn
local opt = vim.opt
local wo = vim.wo

opt.backup = false
opt.breakindent = true
opt.cmdheight = 1
opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
opt.cursorline = true
opt.lazyredraw = true
opt.mouse = "" -- Tmux FTW?
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 8
-- opt.showmode = false
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
opt.timeoutlen = 500
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
opt.timeoutlen = 500
