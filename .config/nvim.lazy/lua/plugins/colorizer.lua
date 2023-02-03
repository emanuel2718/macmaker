local M = {
  "norcalli/nvim-colorizer.lua",
}

function M.config()
  require("colorizer").setup({
    "html",
    "tsx",
    "vue",
    "javascript",
    "typescript",
    "svelte",
    "php",
    "res",
    "markdown",
    "c",
    "cpp",
  })
end

return M
