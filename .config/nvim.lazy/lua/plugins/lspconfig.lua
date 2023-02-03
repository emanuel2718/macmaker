local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
}

local function on_attach(client, _) -- (client, bunfr)
  -- disable formatting for LSP clients as this is handled by null-ls
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

function M.config()
  local nvim_lsp = require("lspconfig")

  -- Set up completion using nvim_cmp with LSP source
  local capabilities = require("cmp_nvim_lsp").default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )

  -- Import requested servers
  local servers = require("core").lsp_servers

  -- Import override settings
  local overrides = require("core").overrides

  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = overrides,
    })
  end
end

M.keys = {
  { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },
  { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" },
  { "gr", "<cmd>lua vim.lsp.buf.references()<CR>" },
  { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
  { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
  { "K", "<cmd>lua vim.lsp.buf.hover()<CR>" },
  { "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>" },
  { "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>" },
  { "<leader>i", "<cmd>lua vim.diagnostic.open_float()<CR>" },
  { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>" },
  { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>" },
  { "<leader>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>" },
}

return M
