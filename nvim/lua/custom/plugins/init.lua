return {
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'onedark_dark'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {
        sort = {
          sorter = 'case_sensitive',
        },
        view = {
          width = 40,
          side = 'left',
        },
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        renderer = {
          highlight_git = false,
          highlight_opened_files = 'name',
          indent_width = 4,
          icons = {
            show = {
              git = false,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
      }

      vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>')
    end,
  },
  {
    'echasnovski/mini.completion',
    version = '*',
    config = function()
      require('mini.completion').setup()
    end,
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('spectre').setup()

      vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = 'Toggle Spectre',
      })
      vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = 'Search current word',
      })
      vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = 'Search current word',
      })
      vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = 'Search on current file',
      })
    end,
  },
  {
    'yorickpeterse/nvim-window',
    config = function()
      require('nvim-window').setup {
        -- The characters available for hinting windows.
        chars = {
          'a',
          's',
          'd',
          'f',
        },

        normal_hl = 'Normal',
        hint_hl = 'Bold',
        border = 'single',
      }
      vim.keymap.set('n', '<leader>gw', '<cmd>lua require("nvim-window").pick()<CR>')
    end,
  },
}
