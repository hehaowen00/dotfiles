local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

autocmd('BufWritePre', {
    pattern = '*',
    command = '%s/\\s\\+$//e',
})

autocmd('BufEnter', {
    pattern = '*',
    command = 'set fo-=c fo-=r fo-=o'
})

augroup('setIndent', { clear = true })

augroup('latex', { clear = true })

autocmd('Filetype', {
  pattern = {
    'c', 'cpp', 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'lua',
    'svelte', 'typescript', 'typescriptreact', 'xml', 'yaml',
  },
  command = 'setlocal ts=2 sw=2 expandtab',
  group = 'setIndent',
})

autocmd('Filetype', {
    pattern = {
      'tex',
    },
    command = 'setlocal wrap',
    group = 'latex',
})
