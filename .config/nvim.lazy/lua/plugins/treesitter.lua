local M = {
  "nvim-treesitter/nvim-treesitter",
}

function M.config()
  -- See https://github.com/nvim-treesitter/nvim-treesitter#available-modules
  local ts = require("nvim-treesitter.configs")
  local langs = require("core").treesitter_langs
  ts.setup({
    ensure_installed = langs,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = function(_, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 10000 -- disable on large files
          or vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]:len() > 500 -- or files w/ very long lines
      end,
    },
    endwise = { enable = true },
    indent = { enable = true },
    autopairs = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<space>",
        node_incremental = "<space>",
        node_decremental = "<backspace>",
      },
    },
  })

  -- TODO: add path to haskell tree-sitter source (https://github.com/tree-sitter/tree-sitter-haskell)
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  parser_config.haskell = {
    install_info = {
      url = "~/.local/src/tree-sitter-haskell/",
      files = { "src/parser.c", "src/scanner.c" },
    },
  }
end

return M
