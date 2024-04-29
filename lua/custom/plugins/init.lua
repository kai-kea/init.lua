-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      },
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          handlers = {
            ['jdtls'] = function()
              require('java').setup()
            end,
          },
        },
      },
    },
    config = function()
      local java = require 'java'
      java.setup()

      vim.keymap.set('n', '<leader>jt', java.test.run_current_class, { desc = '[J]ava: Run [T]est in Current Class' })
      vim.keymap.set('n', '<leader>jv', java.test.view_last_report, { desc = '[J]ava: [V]iew Test Report' })
    end,
  },

  {
    'kawre/leetcode.nvim',
    build = ':TSUpdate html',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- required by telescope
      'MunifTanjim/nui.nvim',

      -- optional
      'nvim-treesitter/nvim-treesitter',
      -- 'rcarriga/nvim-notify',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      ---@type lc.lang
      lang = 'golang',
      injector = { ---@type tableM<lc.lang, lc.inject>
        ['java'] = {
          before = 'import java.util.*;',
        },
        ['golang'] = {
          before = 'package main',
        },
      },
      -- configuration goes here
    },
  },
}
