local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

autocmd('BufWritePre', {
  pattern = '*',
  command = '%s/\\s\\+$//e',
})

autocmd('BufWritePost', {
  pattern = "*",
  command = ":FormatLock",
})

autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o'
})

autocmd('BufEnter', {
  pattern = '*',
  command = 'silent! GuessIndent<CR>',
})

autocmd('Filetype', {
  pattern = {
    'c', 'cpp', 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'lua',
    'svelte', 'typescript', 'typescriptreact', 'xml', 'yaml',
  },
  command = 'setlocal ts=2 sw=2 expandtab',
})
