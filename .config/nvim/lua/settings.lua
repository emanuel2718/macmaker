local opt = vim.opt

opt.autoindent = true
opt.backup = false
opt.completeopt = { "menu", "menuone", "noselect" }
opt.cursorline = true
opt.encoding = 'utf-8'
opt.errorbells = false
opt.expandtab = true
opt.fileencoding = 'utf-8'
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.list = true
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.shell = '/bin/sh'
opt.shiftwidth = 2
opt.showcmd = false
opt.sidescrolloff = 8
opt.signcolumn = 'yes'
opt.smartcase = true
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.statusline = [[%f %y %m %= %p%% %l:%c]]
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.textwidth = 79
opt.timeoutlen = 500
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000
opt.updatetime = 200
opt.wildignore = "*.swp, *.bak, *.pyc, *.class"


-- vim.cmd('autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o')
-- vim.cmd('command CDD cd %:p:h')
-- vim.cmd('autocmd BufWinEnter * setlocal modifiable')

-- NEVER insert comment on newline
vim.api.nvim_create_autocmd("FileType", {
    command = "setlocal formatoptions-=cro",
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank({
        higroup = 'IncSearch',
        timeout = 300
      })
    end
})
