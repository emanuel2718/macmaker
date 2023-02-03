local M = {
  "aktersnurra/no-clown-fiesta.nvim",
}

local core = require("core")

function M.config()
  require("no-clown-fiesta").setup({
    transparent = false, -- Enable this to disable the bg color
    styles = {
      -- You can set any of the style values specified for `:h nvim_set_hl`
      comments = {},
      keywords = {},
      functions = {},
      variables = {},
      -- type = { bold = true },
    },
  })
end

function M.init()
  local colorscheme = require("core").colorscheme
  if colorscheme == "no-clown-fiesta" then
    vim.cmd("colorscheme " .. colorscheme)
  end
end

return M
