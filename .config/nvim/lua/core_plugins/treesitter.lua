require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "cpp",
    "css",
    "fish",
    "graphql",
    "help",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = function(_, bufnr)
      return vim.api.nvim_buf_line_count(bufnr) > 10000 -- disable on large files
          or vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]:len() > 500 -- or files w/ very long lines
    end,
  },
}
