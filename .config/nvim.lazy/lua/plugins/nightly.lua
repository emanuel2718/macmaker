local M = {
  "Alexis12119/nightly.nvim",
}

local core = require("core")

function M.config()
  require("nightly").setup({
    color = "blue", -- gray, green or red
    transparent = false,
    styles = {
      comments = { italic = true },
      functions = { italic = false },
      keywords = { italic = false },
      variables = { italic = false },
    },
    -- highlights = {
    --     -- add or override highlights
    -- },
  })
end

function M.init()
  local colorscheme = require("core").colorscheme
  if colorscheme == "nightly" then
    vim.cmd("colorscheme " .. colorscheme)
  end
end

return M
