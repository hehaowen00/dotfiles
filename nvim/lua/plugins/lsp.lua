local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set

  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "gI", vim.lsp.buf.implementation, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "gl", vim.diagnostic.open_float, opts)
  keymap("n", "rn", vim.lsp.buf.rename, opts)
  keymap("n", "<leader>a", vim.lsp.buf.code_action, opts)
  keymap("n", "<leader>d", vim.lsp.buf.signature_help, opts)
  keymap('n', '<leader>e', vim.diagnostic.open_float, opts)
end

require'lspconfig'.gopls.setup{
  on_attach = on_attach,
}

require'lspconfig'.tsserver.setup{
  on_attach = on_attach,
}

vim.diagnostic.config{
  virtual_text = false
}

