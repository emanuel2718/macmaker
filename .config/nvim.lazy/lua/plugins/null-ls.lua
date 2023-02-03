local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

function M.config()
  local null_ls = require("null-ls")
  local format_on_save = require("core").format_on_save
  local formatting = null_ls.builtins.formatting
  local code_actions = null_ls.builtins.code_actions

  local sources = {}
  local formatters = require("core").mason_formatters
  for _, formatter in ipairs(formatters) do
    -- TODO: add exceptions here
    if formatter == "clang-format" then formatter = "clang_format" end
    table.insert(sources, formatting[formatter])
  end
  table.insert(sources, code_actions.gitsigns)

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup({
    debug = false,
    sources = sources,
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        if format_on_save then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end
    end,
  })
end

return M
