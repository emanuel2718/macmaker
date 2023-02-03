return {
  "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
  config = function()
    require("toggle_lsp_diagnostics").init({ start_on = false })
    vim.api.nvim_set_keymap(
      "n",
      "<leader>dd",
      "<cmd>ToggleDiag<cr>",
      { noremap = true, silent = true }
    )
  end,
}
