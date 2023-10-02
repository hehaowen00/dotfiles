local util = require "formatter.util"

require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    go = {
      require("formatter.filetypes.go").goimports,
      require("formatter.filetypes.go").gofmt,
      -- require("formatter.filetypes.go").golines,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettier,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },
    svelte = {
      function()
        return {
          exe = "npx",
          args = {
            "prettier",
            "--plugin",
            "prettier-plugin-svelte",
            "--bracket-same-line",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
          },
          stdin = true,
          try_node_modules = true
        }
      end,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
