-- https://github.com/nvim-telescope/telescope.nvim

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
