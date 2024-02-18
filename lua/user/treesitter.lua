local M = {}

require 'nvim-treesitter.install'.compilers = { 'zig' }

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.wgsl = {
    install_info = {
        url = "https://github.com/szebniok/tree-sitter-wgsl",
        files = {"src/parser.c"}
    },
}

local options = {
  ensure_installed = { "lua", "rust", "wgsl_bevy"},
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

