require('packer').startup(function(use)
use 'wbthomason/packer.nvim'

use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
-- use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'

use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'

use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

use {
  'nmac427/guess-indent.nvim',
  config = function()
    require('guess-indent').setup{}
  end,
}

use {
  'nvim-treesitter/nvim-treesitter',
  run = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
  end,
}

use {
  'hehaowen00/darkest-one',
  requires = { { 'rktjmp/lush.nvim' } }
}
end)

require('plugins/lsp')
require('plugins/lualine')
require('plugins/nvim-tree')
require('plugins/telescope')
require('plugins/treesitter')
require('plugins/comment')
