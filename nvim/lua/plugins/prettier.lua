local prettier = require'prettier'

prettier.setup{
  bin = 'prettierd',
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "svelte",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  cli_options = {
    print_width = 80,
    single_quote = false,
    semi = true,
    quote_props = "consistent",
    use_tabs = false,
  }
}

local null_ls = require'null-ls'

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup{
	sources = {
		require("null-ls").builtins.formatting.prettierd,
	},
  on_attach = function(client, bufnr)
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, async = async })
      end,
      desc = "[lsp] format on save",
    })
  end
}
