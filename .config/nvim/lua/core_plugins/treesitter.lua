require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
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
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    disable = function(_, bufnr)
      return vim.api.nvim_buf_line_count(bufnr) > 10000 -- disable on large files
          or vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]:len() > 500 -- or files w/ very long lines
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {},
  },
  autotag = {
    enable = true,
  },
  -- rainbow = {
  --   enable = true,
  --   extended_mode = true,
  --   max_file_lines = nil,
  -- },
  incremental_selection = {
    enable = true,
    keymaps = {
      nit_selection = '<c-space>',
      node_incremental = '<c-space>',
      node_decremental = "\\",
      scope_incremental = "<Nop>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
        ["ao"] = "@block.outer",
        ["io"] = "@block.inner",
      },
    },
  },
})
