local g = vim.g
local opt = vim.opt

opt.clipboard = 'unnamedplus'
opt.completeopt = 'menuone,noinsert,noselect'
opt.mouse = 'a'
opt.swapfile = false

opt.colorcolumn = '80'
opt.foldmethod = 'marker'
opt.ignorecase = true
opt.laststatus = 3
opt.linebreak = true
opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.splitright = true
opt.splitbelow = true
opt.smartcase = true
opt.termguicolors = true

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4

opt.cmdheight = 1
opt.conceallevel = 0
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.pumheight = 10
opt.scrolloff = 16
opt.signcolumn = 'no'
opt.synmaxcol = 240
opt.updatetime = 50
opt.wrap = false

opt.shortmess:append "sI"

local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

