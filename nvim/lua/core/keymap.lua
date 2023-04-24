local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, opts)
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

map('n', '<leader>t', ':tabnew<CR>')
map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>5', '5gt')
map('n', '<leader>6', '6gt')
map('n', '<leader>7', '7gt')
map('n', '<leader>8', '8gt')
map('n', '<leader>9', '9gt')
map('n', '<leader>0', '0gt')

map('i', 'kk', '<Esc>')

map('n', 'ff', TelescopeFiles)
map('n', 'fg', TelescopeGrep)

map('n', '<leader>n', ':NvimTreeToggle<CR>')
map('n', '<C-t>', ':NvimTreeClose<CR>')
