function bind(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        opts = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

require('autocmd')
require('keys')
require('opts')
require('plugins')
require('neovide')
