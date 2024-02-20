vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, bufnr)
      require('user.lsp').common_on_attach()
      local lsp_status = require('lsp-status')
      lsp_status.register_progress()
      vim.keymap.set("n", "<S-k>", ":RustLsp hover actions<cr>", { buffer = bufnr })
    end,
    default_settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          command = "clippy"
        },
        diagnostics = {
          disabled = { "unresolved-proc-macro" },
        },

      },
    },
  },
}

return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft = { 'rust' },
}
