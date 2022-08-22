-- https://github.com/nvim-telescope/telescope.nvim

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

telescope.setup(options)

telescope.load_extension("ui-select")


