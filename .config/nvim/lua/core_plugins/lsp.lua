local opts = { noremap = true, silent = true }
local map = vim.keymap.set


local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  -- map('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', bufopts)
  map('n', 'gd', vim.lsp.buf.definition)

  map('n', 'gD', vim.lsp.buf.declaration)
  map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<leader>rr', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  map('n', '<leader>i', vim.diagnostic.open_float, bufopts)
  map('n', '<leader>si', '<cmd>Telescope lsp_document_symbols<cr>', bufopts)
  map('n', '<leader>sw', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', bufopts)
  --
  --format on save
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end
  })
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_config = {
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end
}

require('mason-lspconfig').setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup(lsp_config)
  end,
  sumneko_lua = function()
    require('lspconfig').sumneko_lua.setup(vim.tbl_extend('force', lsp_config, {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }))
  end,
  tsserver = function()
    require('typescript').setup({
      server = vim.tbl_extend('force', lsp_config, {
        on_attach = function(_, bufnr)
          on_attach(_, bufnr)
        end,
        init_options = {
          preferences = {
            importModuleSpecifierPreference = 'project=relative',
            jsxAttributeCompletionStylr = 'none'
          }
        }
      })
    })
  end
})

map('n', '<leader>lc', ':LspRestart<cr>')

map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)

map('n', '<leader>o', ':TypescriptOrganizeImports<cr>')
map('n', '<leader>a', ':TypescriptAddMissingImports<cr>')
map('n', '<leader>R', ':TypescriptRemoveUnused<cr>')
