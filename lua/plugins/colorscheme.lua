return {
    'catppuccin/nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('catppuccin').setup { transparent_background = true }
    end,
    init = function()
      vim.cmd.colorscheme 'catppuccin'
      vim.cmd.hi 'Comment gui=none'
    end,
}
