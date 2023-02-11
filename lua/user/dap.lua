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
--
-- dap.configurations.rust =  {
--         {
--           type = "lldb",
--           request = "launch",
--           name = "Debug executable 'bevy_game'",
--           cargo = {
--             args = {
--                     "build",
--                     "--bin=bevy_game",
--                     "--package=bevy_game"
--                 },
--                 filter= {
--                   name= "bevy_game",
--                   kind= "bin"
--                 }
--             },
--             args = {},
--             env = {
--               CARGO_MANIFEST_DIR = "${workspaceFolder}"
--             },
--             cwd = "${workspaceFolder}"
--         },
--         {
--           type = "lldb",
--           request = "launch",
--           name = "Debug unit tests in executable 'bevy_game'",
--           cargo = {
--             args = {
--                     "test",
--                     "--no-run",
--                     "--bin=bevy_game",
--                     "--package=bevy_game"
--                 },
--                 filter = {
--                   name = "bevy_game",
--                   kind = "bin"
--                 }
--             },
--             args = {}, 
--             cwd = "${workspaceFolder}"
--         }
-- }
