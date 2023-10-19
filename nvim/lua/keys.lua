vim.g.mapleader = ' '

bind('', '<up>', '<nop>')
bind('', '<down>', '<nop>')
bind('', '<left>', '<nop>')
bind('', '<right>', '<nop>')
bind('i', '<C-c>',  '<Esc>')
bind('i', 'kk', '<Esc>')

bind('n', '<leader>s', '<C-w>s')
bind('n', '<leader>v', '<C-w>v')
bind('n', '<leader>q', ':q<CR>')

bind('n', '<leader>h', '<C-w>h')
bind('n', '<leader>j', '<C-w>j')
bind('n', '<leader>k', '<C-w>k')
bind('n', '<leader>l', '<C-w>l')

bind('n', '<leader>t', ':tabnew<CR>')
bind('n', 'ta', '1gt')
bind('n', 'ts', '2gt')
bind('n', 'td', '3gt')
bind('n', 'tf', '4gt')
bind('n', 'tg', '5gt')
bind('n', 'th', '6gt')
bind('n', 'tj', '7gt')
bind('n', 'tk', '8gt')
bind('n', 'tl', '9gt')
bind('n', 't;', '0gt')

bind('v', 'xc', '"_d')
bind('n', 'xl', '"_dd')
bind('n', 'dl', 'dd')

function delete_surround()
  local api = vim.api
  local win = api.nvim_get_current_win()
  local r, c = unpack(api.nvim_win_get_cursor(win))
  local line = api.nvim_get_current_line()
  c = c + 1
  local char = string.sub(line, c, c)

  local valid_chars = {
    ['('] = true,
    [')'] = true,
    ['['] = true,
    [']'] = true,
    ['{'] = true,
    ['}'] = true,
    ['"'] = true,
    ["'"] = true,
  }

  if valid_chars[char] then
    api.nvim_feedkeys('yi' ..char ..'va' .. char .. 'p', 'n', true)
  end
end

bind('n', 'ds', '<cmd>lua delete_surround()<CR>')
bind('n', '<CR>', '<cmd> pumvisible() ? "<C-y>" : "<CR>"', { expr = true })
