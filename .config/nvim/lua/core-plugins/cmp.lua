return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = {
    'hrsh7th/cmp-buffer', -- Buffer Completions
    'hrsh7th/cmp-path', -- Path Completions
    'saadparwaiz1/cmp_luasnip', -- Snippet Completions
    'hrsh7th/cmp-nvim-lsp', -- LSP Completions
    'hrsh7th/cmp-nvim-lua', -- Lua Completions
    'hrsh7th/cmp-cmdline', -- CommandLine Completions
    'L3MON4D3/LuaSnip', -- Snippet Engine
    'rafamadriz/friendly-snippets', -- Bunch of Snippets
    {
      'windwp/nvim-autopairs',
      config = function()
        local autopairs = require('nvim-autopairs')

        autopairs.setup({
          check_ts = true, -- treesitter integration
          map_cr = true,
          disable_filetype = { 'TelescopePrompt' },
        })

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp_status_ok, cmp = pcall(require, 'cmp')
        if not cmp_status_ok then
          return
        end
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({}))
      end,
    },
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    require('luasnip.loaders.from_snipmate').lazy_load({
      paths = vim.fn.stdpath('config') .. '/snippets/snipmate',
    })
    require('luasnip.loaders.from_vscode').lazy_load()
    -- require("luasnip.loaders.from_vscode").lazy_load { paths = vim.fn.stdpath "config" .. "/snippets/vscode" }

    local kind_icons = {
      Text = '',
      Method = '',
      Function = '',
      Constructor = '',
      Field = 'ﰠ',
      Variable = '',
      Class = 'ﴯ',
      Interface = '',
      Module = '',
      Property = 'ﰠ',
      Unit = '塞',
      Value = '',
      Enum = '',
      Keyword = '',
      Snippet = '',
      Color = '',
      File = '',
      Reference = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = 'פּ',
      Event = '',
      Operator = '',
      TypeParameter = '',
    }

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item()),
        ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item()),
        ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item()),
        ['<C-p>'] = cmp.config.disable,
        ['<C-y>'] = cmp.config.disable,
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      formatting = {
        format = function(_, vim_item)
          vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
          return vim_item
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completion = cmp.config.window.bordered({
          border = 'rounded',
          winhighlight = 'Normal:Normal,FloatBorder:CmpCompletionBorder,CursorLine:CmpCursorLine,Search:Search',
          col_offset = -3,
          side_padding = 1,
        }),
        documentation = cmp.config.window.bordered({
          border = 'rounded',
          winhighlight = 'Normal:Normal,FloatBorder:CmpDocumentationBorder,CursorLine:CmpCursorLine,Search:Search',
          col_offset = -3,
          side_padding = 1,
        }),
      },
      experimental = {
        ghost_text = true,
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'cmdline' },
      },
      window = {
        completion = cmp.config.window.bordered({
          border = 'rounded',
          winhighlight = 'Normal:Normal,FloatBorder:CmpCompletionBorder,CursorLine:CmpCursorLine,Search:Search',
          col_offset = -3,
          side_padding = 1,
        }),
      },
      formatting = {
        -- fields = { 'abbr' },
        format = function(_, vim_item)
          vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
          return vim_item
        end,
      },
    })
  end,
}
