local map = vim.keymap.set
local nvim_lsp = require('lspconfig')
local default_opts = { noremap = true, silent = true }
require('lsp-format').setup {}


-- LSP Keymaps
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', default_opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', default_opts)
map('n', '<Leader>t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', default_opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', default_opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', default_opts)
map('n', '<Leader>fn', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', default_opts)
map('n', '<Leader>fr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', default_opts)
map('n', '<Leader>fl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', default_opts)
map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', default_opts)
map('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', default_opts)
map('n', '<Leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', default_opts)
map('n', '<Leader>i', '<cmd>lua vim.diagnostic.open_float()<CR>', default_opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', default_opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', default_opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', default_opts)

-- Servers
nvim_lsp.tailwindcss.setup {}
nvim_lsp.astro.setup {
  init_options = {
    typescript = {
      serverPath = "/usr/lib/node_modules/typescript/lib/tsserverlibrary.js"
    }
  }
}
nvim_lsp.prismals.setup {}
nvim_lsp.sumneko_lua.setup {
  cmd = { '/opt/homebrew/bin/lua-language-server' },
  on_attach = require('lsp-format').on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}
nvim_lsp.tsserver.setup { on_attach = require('lsp-format').on_attach }
nvim_lsp.graphql.setup {}
nvim_lsp.gopls.setup { on_attach = require('lsp-format').on_attach }
nvim_lsp.rust_analyzer.setup { on_attach = require('lsp-format').on_attach }
nvim_lsp.jsonls.setup {
  on_attach = require('lsp-format').on_attach,
  cmd = { "vscode-json-languageserver", '--stdio' },
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
          url = 'http://json.schemastore.org/tsconfig'
        },
        {
          fileMatch = { 'lerna.json' },
          url = 'http://json.schemastore.org/lerna'
        },
        {
          description = 'Prettier config',
          fileMatch = { '.prettierrc', '.prettierrc.json', 'prettier.config.json' },
          url = 'http://json.schemastore.org/prettierrc'
        },
        {
          fileMatch = { 'package.json' },
          url = 'http://json.schemastore.org/package'
        },
      }
    },
  }
}
