if vim.g.vscode then
    -- VSCode extension
else
require("user.config").load()
    -- ordinary Neovim
end