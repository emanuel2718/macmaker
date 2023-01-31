local M = {
  "EdenEast/nightfox.nvim",
}

local core = require("core")

function M.config()
  require("nightfox").setup({
    options = {
      palettes = {
        all = {
          -- black background
          bg1 = "#000000",
        },
      },
    },
  })
end

function M.init()
  local colorscheme = require("core").colorscheme
  if colorscheme == "nightfox" then
    vim.cmd("colorscheme " .. colorscheme)
  end
end

return M
