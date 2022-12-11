local servers = {
  "clangd",
  "cssls",
  "gopls",
  "html",
  "pyright",
  "rust_analyzer",
  "tsserver",
}

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

  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = vim.lsp.buf.formatting_sync,
  })

  vim.api.nvim_create_autocmd("CursorHold", {
    callback = vim.diagnostic.open_float,
  })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in pairs(servers) do
  require'lspconfig'[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

require'lspconfig'.omnisharp.setup {
  cmd = { "dotnet", "/usr/bin/omnisharp" },
  organize_imports_on_format = true,
  enable_roslyn_analyzers = true,
  enable_import_completion = true,
  sdk_include_prereleases = false,
  analyze_open_documents_only = false,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

vim.diagnostic.config({
  virtual_text = false
})
