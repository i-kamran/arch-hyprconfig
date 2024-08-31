-- Lua function to insert metadata template
function InsertYAMLTemplate()
  -- Get the current file name
  local file_name = vim.fn.expand("%:t:r")
  
  -- Get the current date and time
  local date = os.date("%Y-%m-%d %H:%M")

  -- Define the template
  local template = string.format([[
---
title: %s
creation date: %s
summary:
tags:
  -
aliases:
  -
---

## %s

Table of Contents

1. [%s](#Reference)

---

### Reference
]], file_name, date, file_name, file_name)

  -- Insert the template into the current buffer
  vim.api.nvim_put(vim.split(template, '\n'), 'l', false, true)
end
