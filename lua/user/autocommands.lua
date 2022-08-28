local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

local mkdir = api.nvim_create_augroup("Mkdir", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  command = 'call mkdir(expand("<afile>:p:h"), "p")' ,
  group = mkdir,
})

api.nvim_create_autocmd('FileType', {pattern = {'dart'}, command = "lua WhichKeyFlutter()"})

function _G.reload_nvim_conf()
  for name,_ in pairs(package.loaded) do
    if name:match('^user')  then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

