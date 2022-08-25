local ok, flutter = pcall(require, 'flutter-tools')

if not ok then
  return
end

if not ok then
  return
end

flutter.setup {
lsp = {
    on_attach = require('user.lsp').common_on_attach,
  }
}
