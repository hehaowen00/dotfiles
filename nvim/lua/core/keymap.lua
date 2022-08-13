local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ';'

map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

map('n', '<leader>r', '%so %<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>v', '<C-w>v')
map('n', '<leader>s', '<C-w>s')
map('n', '<leader>w', ':wa<CR>')

map('n', '<leader>h', '<C-w>h')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>l', '<C-w>l')

map('i', 'kk', '<Esc>')
map('n', 'ff', ':lua TelescopeFiles()<CR>')
map('n', 'fg', ':lua TelescopeGrep()<CR>')
map('n', '<C-n>', ':NvimTreeToggle<CR>')
