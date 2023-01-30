return {
  'nvim-tree/nvim-tree.lua',
  module = true,
  cmd = {
    'NvimTreeOpen',
    'NvimTreeToggle',
    'NvimTreeFocus',
    'NvimTreeFindFile',
    'NvimTreeFindFileToggle',
  },
  dependencies = {
    {
      'nvim-tree/nvim-web-devicons',
      config = function()
        local icons = require('nvim-web-devicons')

        icons.set_icon({
          deb = { icon = '', name = 'Deb', color = '#a1b7ee' },
          lock = { icon = '', name = 'Lock', color = '#c4c720' },
          mp3 = { icon = '', name = 'Mp3', color = '#d39ede' },
          mp4 = { icon = '', name = 'Mp4', color = '#9ea3de' },
          out = { icon = '', name = 'Out', color = '#abb2bf' },
          ['robots.txt'] = { icon = 'ﮧ', name = 'Robots', '#abb2bf' },
          ttf = { icon = '', name = 'TrueTypeFont', '#abb2bf' },
          rpm = { icon = '', name = 'Rpm', '#fca2aa' },
          woff = { icon = '', name = 'WebOpenFontFormat', color = '#abb2bf' },
          woff2 = { icon = '', name = 'WebOpenFontFormat2', color = '#abb2bf' },
          xz = { icon = '', name = 'Xz', color = '#519aba' },
          zip = { icon = '', name = 'Zip', color = '#f9d71c' },
          snippets = { icon = '', name = 'Snippets', color = '#51afef' },
          ahk = { icon = '', name = 'AutoHotkey', color = '#51afef' },
        })
      end,
    },
  },
  config = function()
    local nvim_tree = require('nvim-tree')
    local nvim_tree_config = require('nvim-tree.config')
    local tree_cb = nvim_tree_config.nvim_tree_callback
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    -- vim.g.nvim_tree_respect_buf_cwd = 1

    nvim_tree.setup({
      update_focused_file = {
        enable = true,
        -- update_cwd = true,
        -- sync_root_with_cwd = true,
      },
      sort_by = 'case_sensitive',
      filters = {
        custom = { '^.git$', '^node_modules$', '^.build$', '.vscode' },
      },
      actions = {
        use_system_clipboard = true,
        open_file = { quit_on_open = true },
      },
      view = {
        cursorline = false,
        float = {
          enable = false,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = 'editor',
            border = 'rounded',
            width = 30,
            height = 30,
            row = 1,
            col = 1,
          },
        },
        hide_root_folder = false,
        mappings = {
          custom_only = false,
          list = {
            { key = { 'l', '<CR>', 'o' }, cb = tree_cb('edit') },
            { key = 'h', cb = tree_cb('close_node') },
            { key = 'v', cb = tree_cb('vsplit') },
            { key = 's', cb = tree_cb('split') },
            { key = 'u', action = 'dir_up' },
            { key = 'H', action = 'toggle_dotfiles' },
          },
        },
      },
    })
  end,
}
