-- Visual mode: yank selection with file:line_start-line_end prefix
vim.keymap.set('v', '<leader>ya', function()
  local start_line = vim.fn.line('v')
  local end_line = vim.fn.line('.')
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local filename = vim.fn.expand('%:.')  -- relative path
  local lines = vim.fn.getline(start_line, end_line)
  local filetype = vim.bo.filetype
  local content = string.format(
    '```%s\n-- %s L%d-%d\n%s\n```',
    filetype, filename, start_line, end_line,
    table.concat(lines, '\n')
  )
  vim.fn.setreg('+', content)
  print(string.format('Copied %s:%d-%d', filename, start_line, end_line))
end, { desc = 'Yank selection for AI chat' })


-- Visual mode: yank selection with file:line_start-line_end
vim.keymap.set('v', '<leader>yl', function()
  local start_line = vim.fn.line('v')
  local end_line = vim.fn.line('.')
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local filename = vim.fn.expand('%:.')  -- relative path
  local lines = vim.fn.getline(start_line, end_line)
  local filetype = vim.bo.filetype
  local content = string.format(
    '%s L%d-%d',
    filename, start_line, end_line)

  vim.fn.setreg('+', content)
  print(string.format('Copied %s:%d-%d', filename, start_line, end_line))
end, { desc = 'Yank selection for AI chat' })
