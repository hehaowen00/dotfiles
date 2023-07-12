local function bind(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        opts = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

bind('', '<up>', '<nop>')
bind('', '<down>', '<nop>')
bind('', '<left>', '<nop>')
bind('', '<right>', '<nop>')

bind('n', '<leader>s', '<C-w>s')
bind('n', '<leader>v', '<C-w>v')
bind('n', '<leader>q', ':q<CR>')

bind('i', 'kk', '<Esc>')

bind('n', '<leader>h', '<C-w>h')
bind('n', '<leader>j', '<C-w>j')
bind('n', '<leader>k', '<C-w>k')
bind('n', '<leader>l', '<C-w>l')

bind('n', '<leader>t', ':tabnew<CR>')
bind('n', '1t', '1gt')
bind('n', '2t', '2gt')
bind('n', '3t', '3gt')
bind('n', '4t', '4gt')
bind('n', '5t', '5gt')
bind('n', '6t', '6gt')
bind('n', '7t', '7gt')
bind('n', '8t', '8gt')
bind('n', '9t', '9gt')
bind('n', '0t', '0gt')

bind('n', '<leader>n', ':NvimTreeToggle<CR>')
bind('n', '<leader>c', ':NvimTreeClose<CR>')

bind('n', 'ff', TelescopeFiles)
bind('n', 'fg', require('telescope.builtin').live_grep)
