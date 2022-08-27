local M = {} -- https://github.com/goolord/alpha-nvim

M.setup = function()

  local status_ok, alpha = pcall(require, "alpha")
  if not status_ok then
    return
  end

  local dashboard = require("user.dashboard-theme")

  alpha.setup(dashboard.opts)
end

return M
