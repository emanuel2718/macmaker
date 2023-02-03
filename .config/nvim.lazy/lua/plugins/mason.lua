local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  lazy = false,
}

function M.config()
  local mason = require("mason")
  local mason_config = require("mason-lspconfig")
  local mason_registry = require("mason-registry")
  local servers = require("core").lsp_servers
  local servers_setup_only = require("core").lsp_servers_only_setup
  local formatters = require("core").mason_formatters

  mason.setup({})
  mason_config.setup({
    ensure_installed = servers,
  })

  for _,formatter in ipairs(formatters) do
    if not mason_registry.is_installed(formatter) then
      vim.cmd(":MasonInstall " .. formatter)
    end
  end

  -- manually installed server setup
  for _,server in ipairs(servers_setup_only) do
    require("lspconfig")[server].setup({})
  end

end

return M
