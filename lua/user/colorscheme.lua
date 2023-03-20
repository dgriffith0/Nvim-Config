local M = {}

M.theme = 'tokyonight-night' -- "gruvbox"

-- vim.o.background = "dark" -- or "light" for light mode
-- vim.g.tokyonight_style = "night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. M.theme)
if not status_ok then
  vim.notify("colorscheme " .. M.theme .. " not found!")
  return
end

return M
