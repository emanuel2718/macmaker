local M = {}
local map = vim.keymap.set

local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- M.capabilities.offsetEncoding = { "utf-16" }
-- M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities()

M.setup = function()
  local signs = { Error = 'E', Warn = 'W', Hint = 'H', Info = 'I' }
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local config = {
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] =
  vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })
end

local function lsp_keymaps(bufnr)
  local default_opts = { buffer = bufnr, silent = true }
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', default_opts)
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', default_opts)
  map('n', '<Leader>t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', default_opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', default_opts)
  map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', default_opts)
  map('n', '<Leader>fn', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', default_opts)
  map(
    'n',
    '<Leader>fr',
    '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
    default_opts
  )
  map(
    'n',
    '<Leader>fl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
    default_opts
  )
  map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', default_opts)
  map('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', default_opts)
  map('n', '<Leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', default_opts)
  map('n', '<Leader>i', '<cmd>lua vim.diagnostic.open_float()<CR>', default_opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', default_opts)
  map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', default_opts)
  map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', default_opts)
end

-- Highlight symbol under cursor
local function lsp_highlight(client, bufnr)
  if client.supports_method('textDocument/documentHighlight') then
    vim.api.nvim_create_augroup('lsp_document_highlight', {
      clear = false,
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = 'lsp_document_highlight',
    })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local function disable_format_on_save()
  vim.api.nvim_del_augroup_by_name('Format on save')
  vim.notify('Format on save is now disabled', vim.log.levels.INFO)
end

local function enable_format_on_save(client)
  vim.api.nvim_create_augroup('Format on save', { clear = false })
  vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
      vim.lsp.buf.format({
        filter = function()
          if client.supports_method('textDocument/formatting') then
            return client.name ~= 'null-ls'
          else
            return 'null-ls'
          end
        end,
      })
    end,
    group = 'Format on save',
  })
  vim.notify('Format on save is now enabled', vim.log.levels.INFO)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight(client, bufnr)
  vim.api.nvim_create_user_command('FormatOnSaveToggle', function()
    if vim.fn.exists('#Format on save#BufWritePre') == 0 then
      enable_format_on_save(client)
    else
      disable_format_on_save()
    end
  end, { nargs = '*' })
  client.server_capabilities.semanticTokensProvider = nil
end

return M
