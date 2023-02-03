local M = {
  "folke/trouble.nvim",
  dependencies = "kyazdani42/nvim-web-devicons",
}

M.config = true

M.keys = {
  { "<leader>tt", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true } },
  { "<leader>T", "<cmd>TodoTrouble<cr>", { silent = true, noremap = true } },
  --vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
  --vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
  --vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
  --vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})
  --vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true})
}

return M
