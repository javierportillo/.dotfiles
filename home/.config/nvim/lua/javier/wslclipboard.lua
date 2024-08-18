if vim.fn.has('wsl') then
  vim.g.clipboard = {
    name = 'WSLClipboard',
    copy = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf'
    },
    paste = {
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf'
    },
    cache_enabled = 0,
  }
end
