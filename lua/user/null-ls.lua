local ok, null_ls = pcall(require, '"null-ls"')

if not ok then
  return
end

local options = {
  sources = {
    null_ls.builtins.formatting.rustfmt
  }
}

null_ls.setup(options)
