-- yank selection absolute path file:line_start-line_end
vim.keymap.set('v', '<leader>ca', function()
  local start_line = vim.fn.line('v')
  local end_line = vim.fn.line('.')
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local filename = vim.fn.expand('%:.')  -- relative path
  local lines = vim.fn.getline(start_line, end_line)
  local filetype = vim.bo.filetype
  local content = string.format(
    '@%s L%d-%d\n```%s\n%s\n```',
    filename, start_line, end_line, filetype,
    table.concat(lines, '\n')
  )
  vim.fn.setreg('+', content)
  vim.notify(string.format('Copied %s:L%d-%d', filename, start_line, end_line), vim.log.levels.INFO)
end, { desc = 'Yank selection for AI chat' })




-- yank selection reference (@file:line_start-line_end)
vim.keymap.set('v', '<leader>cr', function()
  local start_line = vim.fn.line('v')
  local end_line = vim.fn.line('.')
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local filename = vim.fn.expand('%:.')
  local content = string.format(
    '@%s L%d-%d',
    filename, start_line, end_line)

  vim.fn.setreg('+', content)
  vim.notify(string.format('Copied %s', content), vim.log.levels.INFO)
end, { desc = 'Yank selection for AI chat' })
