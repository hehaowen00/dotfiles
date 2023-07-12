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

bind('n', '<leader>n', ':NvimTreeToggle<CR>')
bind('n', '<leader>c', ':NvimTreeClose<CR>')

bind('n', 'ff', TelescopeFiles)
bind('n', 'fg', require('telescope.builtin').live_grep)
