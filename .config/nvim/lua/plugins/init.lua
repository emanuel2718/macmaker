return {
  { "tpope/vim-fugitive", cmd = { "Git" } },
  -- { "lukas-reineke/indent-blankline.nvim", enable = false },
  -- { "windwp/nvim-ts-autotag", ft = { "html", "tsx", "vue", "svelte", "php", "res" } },
  { "windwp/nvim-autopairs", config = true },
  { "numToStr/Comment.nvim", config = true },
  -- { "tpope/vim-surround" },
  { "famiu/bufdelete.nvim", cmd = { "Bdelete" } },
  { "mbbill/undotree", keys = { { "<leader>u", "<cmd>UndotreeToggle|UndotreeFocus<CR>", { silent = true } } } },
}
