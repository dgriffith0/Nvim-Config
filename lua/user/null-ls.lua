M = {}

M.setup = function()
  local ok, null_ls = pcall(require, '"null-ls"')

  if not ok then
    return
  end

  local options = {
    sources = {
      null_ls.builtins.formatting.rustfmt,
 null_ls.builtins.formatting.stylua
    }
  }

  null_ls.setup(options)
end

return M
