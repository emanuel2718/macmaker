return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  opts = {
    PATH = "prepend",
    max_concurrent_installers = 10
  },
  config = function(_, opts)
    require("mason").setup(opts)
  end

}
