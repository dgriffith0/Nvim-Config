local M = {}

M.load = function()
  require "user.options"
  require "user.plugin-loader"
  require "user.utils"
  require "user.colorscheme"
  require "user.keymaps"
  require "user.autocommands"
  require "user.lsp"
  require "user.dap"
end

return M
