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
    }
  }

  tree.setup(options)
end

return M
