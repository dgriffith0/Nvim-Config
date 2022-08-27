local M = {}

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local options = {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}

M.setup = function()
  telescope.setup(options)
  telescope.load_extension("ui-select")
end

return M
