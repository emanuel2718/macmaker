-- vim.cmd('colorscheme gruvbox-material')
vim.cmd [[colorscheme no-clown-fiesta]]

require("no-clown-fiesta").setup({
  transparent = false, -- Enable this to disable the bg color
  styles = {
    comments = {},
    keywords = {},
    functions = {},
    variables = {},
    type = { bold = true },
  },
})
