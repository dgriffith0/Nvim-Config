local M = {}

require 'nvim-treesitter.install'.compilers = { 'zig' }

local options = {
  ensure_installed = { "lua", "rust" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  endwise = {
    -- Enables plugin: https://github.com/RRethy/nvim-treesitter-endwise
    enable = true
  },
  rainbow = {
    enable = true
  }
}

M.setup = function()
  local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
  if not status_ok then
    return
  end

  treesitter.setup(options)
end

return M

