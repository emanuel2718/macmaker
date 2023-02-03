local M = {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = { "NeoTree", "NeoTreeFloat" },
}

function M.config()
  require("neo-tree").setup({
    enable_diagnostics = false,
    window = {
      mappings = {
        ["<Tab>"] = "toggle_node",
        ["<cr>"] = "open",
        ["h"] = "close_node",
        ["l"] = "open",
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
      },
    },
  })
end

M.keys = {
  { "<leader>e", "<cmd>NeoTreeFocusToggle<CR>" },
}

return M
