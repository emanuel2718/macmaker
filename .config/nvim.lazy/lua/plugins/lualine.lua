return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        disabled_filetypes = {
          "dashboard",
          "lspinfo",
          "mason",
          "startuptime",
          "checkhealth",
          "help",
          "TelescopePrompt",
          "toggleterm",
          "alpha",
          "lazy",
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filename",
            file_status = true,
            newfile_status = true,
            path = 3,
            shorting_target = 40,
          },
        },
        lualine_x = { "filetype" },
        lualine_y = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            color_error = "#BF616A",
            color_warn = "#EBCB8B",
            color_info = "#88C0D0",
            color_hint = "#3A4151",
          },
        },
        lualine_z = { "location" },
      },
    })
  end,
}
