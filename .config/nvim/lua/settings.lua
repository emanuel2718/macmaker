local opt = vim.opt

opt.number = true
opt.numberwidth = 1
opt.relativenumber = true
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.shiftround = true
opt.mouse = 'a'
opt.foldlevel = 99
opt.foldmethod = 'indent'
opt.foldenable = true
opt.termguicolors = true
opt.signcolumn = 'yes'
-- opt.statusline = [[%f %y %m %= %p%% %l:%c]]
opt.backup = false
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
opt.showcmd = false
opt.encoding = 'utf-8'
opt.errorbells = false

-- NEVER insert comment on newline
vim.api.nvim_create_autocmd("FileType", {
  command = "setlocal formatoptions-=cro",
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 100
    })
  end
})
