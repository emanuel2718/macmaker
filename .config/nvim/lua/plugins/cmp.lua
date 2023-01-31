local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua", -- Hack Neovim
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind-nvim",
  },
}

function M.config()
  local lspkind = require("lspkind")
  local cmp = require("cmp")
  cmp.setup({
    completion = {
      autocomplete = {
        require("core").autocmp
          and require("cmp.types").cmp.TriggerEvent.TextChanged,
      },
      -- completeopt = 'menu,menuone,noselect',
      -- keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
      -- keyword_length = 1,
    },
    mapping = cmp.mapping.preset.insert({
      -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item()),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item()),
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item()),
      ["<C-p>"] = cmp.config.disable,
      ["<C-y>"] = cmp.config.disable,
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "luasnip" },
      { name = "buffer", keyword_length = 5 },
    },
    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        function(entry1, entry2)
          local _, entry1_under = entry1.completion_item.label:find("^_+")
          local _, entry2_under = entry2.completion_item.label:find("^_+")
          entry1_under = entry1_under or 0
          entry2_under = entry2_under or 0
          if entry1_under > entry2_under then
            return false
          elseif entry1_under < entry2_under then
            return true
          end
        end,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[api]",
          path = "[path]",
          luasnip = "[snip]",
        },
      }),
    },
    experimental = {
      native_menu = false,
      ghost_text = false,
    },
  })
end

return M
