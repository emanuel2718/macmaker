local M = {}

M.autocmp = true
M.format_on_save = true

M.mapleader = " "
M.lang = "en_us"

M.bg_is_transparent = false
M.lualine_theme = "auto"

-- M.colorscheme = "habamax"
-- M.colorscheme = "tokyonight-night"
M.colorscheme = "nightly"
-- M.colorscheme = "no-clown-fiesta"
-- M.colorscheme = "carbonfox"
-- M.colorscheme = "default"

M.treesitter_langs = {
  "bash",
  "cmake",
  "css",
  "dockerfile",
  "go",
  "hcl",
  "html",
  "java",
  "javascript",
  "json",
  "latex",
  "lua",
  "markdown",
  "python",
  "query", -- treesitter/playground
  "r",
  "rust",
  "toml",
  "typescript",
  "vue",
  "yaml",
}

M.lsp_servers = {
  "cssls", -- css
  "html", -- html
  "intelephense", -- php
  "pyright", -- python
  "rust_analyzer", -- rust
  "sumneko_lua", -- lua
  "tailwindcss", -- tailwindcss
  "tsserver", -- js, jsx, ts, tsx
  "volar", -- vue
  "clangd", -- c et. al.
}

M.lsp_servers_only_setup = {
  "hls",
}

M.mason_formatters = {
  "black",
  "clang-format",
  -- "fourmolu",
  "prettierd",
  "rustfmt",
  "shfmt",
  "stylua",
}

M.overrides = {
  Lua = {
    diagnostics = {
      globals = { "vim" }, -- removes that annoying "vim global not defined warning"
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true),
      checkThirdParty = false, -- HACK: is this a hack?
    },
  },
  cssls = { format = { enable = false } },
  tsserver = {
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
  },
  -- https://rust-analyzer.github.io/manual.html#nvim-lsp
  ["rust-analyzer"] = {
    imports = {
      granularity = {
        group = "module",
      },
      prefix = "self",
    },
    cargo = {
      buildScripts = {
        enable = true,
      },
    },
    procMacro = {
      enable = true,
    },
  },
  -- Having this here enables take-over mode (if you don't use Vue, you don't need this)
  volar = {
    filetypes = {
      "typescript",
      "javascript",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "json",
    },
  },
}

------------------------------------------------------------ [[ LAZY OPTIONS ]]
M.lazy_opts = {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

return M
