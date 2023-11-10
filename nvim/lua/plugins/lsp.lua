local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set

  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "gh", vim.lsp.buf.hover, opts)
  keymap("n", "gI", vim.lsp.buf.implementation, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "rn", vim.lsp.buf.rename, opts)
  keymap("n", "ga", vim.lsp.buf.code_action, opts)
  keymap("n", "gs", vim.lsp.buf.signature_help, opts)
  keymap('n', 'ge', vim.diagnostic.open_float, opts)
  keymap("n", "gl", vim.diagnostic.setqflist, opts)
end

require'lspconfig'.gopls.setup{
  on_attach = on_attach,
}

require'lspconfig'.tsserver.setup{
  on_attach = on_attach,
}

require'lspconfig'.svelte.setup{
  on_attach = on_attach,
}

require'lspconfig'.tailwindcss.setup{
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'svelte',
  },
  on_attach = on_attach,
}

require'lspconfig'.bufls.setup{
  on_attach = on_attach,
}

vim.diagnostic.config{
  virtual_text = false
}
