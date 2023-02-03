local opt = vim.opt

vim.cmd("autocmd!")

opt.number = true
opt.relativenumber = true

opt.autoindent = true
opt.smartindent = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true

opt.lazyredraw = true

opt.backup = false
opt.writebackup = false
opt.signcolumn = 'yes'

opt.swapfile = false

opt.showcmd = false
opt.cmdheight = 1

opt.mouse = "a"

opt.hlsearch = false

opt.wrap = false

opt.cursorline = true

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.textwidth = 79

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.splitbelow = true
opt.splitright = true

opt.errorbells = false

opt.termguicolors = true

opt.updatetime = 350

opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })

opt.laststatus = 2

--opt.winblend = 0
-- opt.wildoptions = "pum"
-- opt.pumblend = 5
opt.background = "dark"


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
