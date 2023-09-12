require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "css",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "rust",
    "scss",
    "sql",
    "svelte",
    "typescript",
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = {
     "svelte",
    },
  },
}
