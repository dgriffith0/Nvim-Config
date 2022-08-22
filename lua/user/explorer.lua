local ok, tree = pcall(require, 'nvim-tree')

if not ok then
  return
end

local options = {
  filters = {
    dotfiles = true
  }
}

tree.setup(options)
