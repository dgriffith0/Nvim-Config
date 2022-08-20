local status_ok, lualine = pcall(require, 'lualine')

if not status_ok then
  print("Unable to load luiline")
  return
end

local options = {options = { theme = 'gruvbox' }}

lualine.setup(options)
