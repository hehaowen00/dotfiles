require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      '.git/',
    },
  },
  pickers = {
    find_files = {
      previewer = false,
      theme = 'dropdown',
    },
  },
}

function TelescopeFiles()
  require('telescope.builtin').find_files{
    find_command = {
      'rg',
      '--files',
      '--hidden',
      '--follow',
    },
  }
end

bind('n', 'ff', TelescopeFiles)
bind('n', '<leader>g', require('telescope.builtin').live_grep)
bind('n', '<leader>f', require('telescope.builtin').current_buffer_fuzzy_find)
