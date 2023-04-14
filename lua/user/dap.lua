local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  require("notify")("Dap Initialized")
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  require("notify")("Dap Terminated")
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  require("notify")("Dap Exited")
  dapui.close()
end

dap.adapters.lldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    detached = false,
  },
  enrich_config = function(config, on_config)
    -- If the configuration(s) in `launch.json` contains a `cargo` section
    -- send the configuration off to the cargo_inspector.
    if config["cargo"] ~= nil then on_config(require('user.dap_cargo').cargo_inspector(config)) end
  end,
}

vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
vim.fn.sign_define('DapBreakpoint', {text='', texthl='DapBreakpoint', linehl='', numhl='DapBreakpoint'})

