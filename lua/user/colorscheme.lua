local M = {}

M.theme = 'tokyonight' -- "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. M.theme)
if not status_ok then
  vim.notify("colorscheme " .. M.theme .. " not found!")
  return
end

vim.o.background = "dark" -- or "light" for light mode

return M
