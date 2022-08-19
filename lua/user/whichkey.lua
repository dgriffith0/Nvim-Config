-- https://github.com/folke/which-key.nvim

local status_ok, telescope = pcall(require, "which-key")
if not status_ok then
  return
end

require("which-key").setup {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
}
