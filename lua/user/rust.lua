local M = {}

local ok, rt = pcall(require, 'rust-tools')

if not ok then
  return
end

local opts = {
  tools = {
    autoSetHints = true,
    runnables = {
      use_telescope = true
    },
    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  server = {
    on_attach = function(_, bufnr)
      require('user.lsp').common_on_attach()
      vim.keymap.set("n", "<S-k>", rt.hover_actions.hover_actions, { buffer = bufnr })
    end,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        },
        diagnostics = {
          disabled = {"unresolved-proc-macro"},
        },
      },
    },
  },
}

M.setup = function()
  local lsp_status = require('lsp-status')
  lsp_status.register_progress()
  rt.setup(opts)
end

return M
