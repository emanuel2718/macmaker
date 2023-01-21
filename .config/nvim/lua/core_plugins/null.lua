local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

local sources = {
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.completion.spell,
  formatting.autopep8,
  formatting.prettier,

  code_actions.eslint_d,
}

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

null_ls.setup({
  sources = sources,
  on_attach = on_attach,
})
