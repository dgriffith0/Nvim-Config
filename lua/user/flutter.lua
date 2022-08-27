local M = {}

local ok, flutter = pcall(require, 'flutter-tools')

if not ok then
  return
end

local options = {
  lsp = {
    on_attach = require('user.lsp').common_on_attach,
  }
}

M.setup = function()
  flutter.setup(options)
end

return M
