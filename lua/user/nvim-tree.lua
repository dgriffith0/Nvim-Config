local M = {}

M.setup = function()
  local ok, tree = pcall(require, 'nvim-tree')

  if not ok then
    return
  end

  local options = {
    view = {
      adaptive_size = true,
      -- width = 100,
      side = "right"
    },
    filters = {
      dotfiles = true
    },
    filesystem_watchers = {
      enable = true,
      debounce_delay = 50,
      ignore_dirs = {},
    },
  }

  tree.setup(options)
end

return M
