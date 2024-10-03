-- Lua function to insert metadata template
function InsertYAMLTemplate()
  -- Get the current file name
  local file_name = vim.fn.expand("%:t:r")
  
  -- Get the current date and time
  local date = os.date("%Y-%m-%d %H:%M")

  -- Define the template
  local template = string.format([[
---
creation date: %s
tags:
  -
---

## %s]], date, file_name)

  -- Insert the template into the current buffer
  vim.api.nvim_put(vim.split(template, '\n'), 'l', false, true)
end
