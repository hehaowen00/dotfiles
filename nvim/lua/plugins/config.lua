require('onedark').setup {
  style = 'darker',
  colors = { fg = '#b2bbcc' },
}

require('onedark').load()

require('plugins/comment')
require('plugins/lsp')
require('plugins/lualine')
require('plugins/nvim-cmp')
require('plugins/nvim-tree')
require('plugins/telescope')
require('plugins/treesitter')
require('leap').add_default_mappings()
