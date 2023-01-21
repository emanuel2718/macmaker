-- require('gitsigns').setup {
--   signs = {
--     add = { text = '+' },
--     change = { text = 'c' },
--     delete = { text = 'd' },
--     topdelete = { text = '‾' },
--     changedelete = { text = 'd' },
--   },
-- }
--

local config = require('gitsigns')

config.setup {
  signs = {
    add          = { hl = 'GitSignsAdd', text = ' ▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    change       = { hl = 'GitSignsChange', text = ' ▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = ' ▎', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = ' ▎', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = ' ▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 1000,
  }
}
