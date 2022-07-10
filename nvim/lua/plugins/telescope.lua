require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      '.git/',
    }
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
      previewer = false,
    },
    live_grep = {
      theme = 'dropdown',
    }
  },
})

function TelescopeFiles()
  require('telescope.builtin').find_files({
    find_command = {
      'rg',
      '--files',
      '--hidden',
      '--follow',
    },
  })
end

function TelescopeGrep()
  require('telescope.builtin').live_grep({})
end
