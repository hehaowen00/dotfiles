vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local HEIGHT_RATIO = 0.6  -- You can change this
local WIDTH_RATIO = 0.4

require('nvim-tree').setup({
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  renderer = {
    highlight_git = false,
    indent_width = 4,
    icons = {
      show = {
        git = false,
      },
    },
  },
  view = {
    side = 'left',
    width = 30,
  },
})

bind('n', '<leader>n', ':NvimTreeToggle<CR>')
bind('n', '<leader>c', ':NvimTreeClose<CR>')

