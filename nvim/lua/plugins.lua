local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
vim.cmd [[packadd packer.nvim]]

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
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
}
use 'jose-elias-alvarez/null-ls.nvim'
use 'MunifTanjim/prettier.nvim'

use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons',
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
  'nvim-treesitter/nvim-treesitter',
  run = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
  end,
}

use 'lukas-reineke/indent-blankline.nvim'

use {
  'nmac427/guess-indent.nvim',
  config = function()
    require('guess-indent').setup{}
  end,
}

use "navarasu/onedark.nvim"
end)

require('plugins/lsp')
require('plugins/lualine')
require('plugins/nvim-tree')
require('plugins/telescope')
require('plugins/treesitter')
require('plugins/indent-line')
require('plugins/comment')
require('plugins/onedark')
require('plugins/prettier')
