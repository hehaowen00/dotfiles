local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
'neovim/nvim-lspconfig',
{
  'echasnovski/mini.completion',
  version = '*',
  config = function()
    require('mini.completion').setup()
  end
},
{
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup()
  end
},
'mhartington/formatter.nvim',
{
  'Exafunction/codeium.vim',
  event = 'BufEnter'
},
{
  'nvim-treesitter/nvim-treesitter',
  config = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
  end,
},
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
},
{
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' }
},
{
  'nmac427/guess-indent.nvim',
  config = function()
    require('guess-indent').setup{}
 end,
},
{
  'numToStr/Comment.nvim',
  config = function()
      require('Comment').setup()
  end
},
"navarasu/onedark.nvim"
})

require('plugins/formatter')
require('plugins/lsp')
require('plugins/treesitter')
require('plugins/nvim-tree')
require('plugins/telescope')
require('plugins/onedark')
