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
'hrsh7th/cmp-nvim-lsp',
'hrsh7th/cmp-buffer',
'hrsh7th/cmp-path',
'hrsh7th/nvim-cmp',
'L3MON4D3/LuaSnip',
'williamboman/mason.nvim',
'mhartington/formatter.nvim',
-- {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   build = ":Copilot auth",
--   event = "InsertEnter",
--   config = function()
--     require("copilot").setup({
--       panel = {
--         enabled = false,
--         auto_refresh = false,
--       },
--       suggestion = {
--         enabled = true,
--         auto_trigger = true,
--         accept = false, -- disable built-in keymapping
--         debounce = 75,
--         keymap = {
--           accept = "<C-l>",
--           accept_word = false,
--           accept_line = false,
--           next = "<C-]>",
--           prev = "<C-[>",
--           dismiss = "<C-]>",
--         },
--       },
--       filetypes = {
--         yaml = false,
--         markdown = false,
--         help = false,
--         gitcommit = false,
--         gitrebase = false,
--         ["."] = false,
--       }
--     })
--   end,
-- },
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
  config = function()
    require("nvim-tree").setup {}
  end,
},
{
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }
},
{
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
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
require('plugins/lualine')
require('plugins/nvim-tree')
require('plugins/telescope')
require('plugins/onedark')
