return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  priority = 1000,
  config = function()
    require('dashboard').setup {
      config = {
        shortcut = {},
        packages = { enable = false },
        week_header = {
          enable = true
        },
        footer = {}, -- footer
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
