local ok, tree = pcall(require, 'nvim-tree')

if not ok then
  return
end

local options = {
  view = {
    width = 100,
    side = "right"
  },
  filters = {
    dotfiles = true
  }
}

tree.setup(options)
