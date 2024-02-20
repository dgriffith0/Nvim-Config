local M = {}

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

function launchjson_continue()
  if vim.fn.filereadable('.vscode/launch.json') then
    require('dap.ext.vscode').load_launchjs(nil, { lldb = { 'rust' } })
  end
  require('dap').continue()
end

local mappings = {
  [";"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
  ["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  d = {
    name = "Debug",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua launchjson_continue()<cr>", "Start" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
  },
  ["v"] = { name = "Vim",
    c = { "<cmd>lua require('user.custom-finders').find_config_files()<cr>", "Configs" },
    d = { ":exec &bg=='light'? 'set bg=dark' : 'set bg=light'<CR>", "Dark/Light Mode"},
    w = { "<cmd>wa<CR>", "Save All" },
    q = { "<cmd>wqa<CR>", "Save & Quit" },
    r = { "<cmd>lua reload_nvim_conf()<cr>", "Reload" },
  },
  ["c"] = { "<cmd>bp|bd #<CR>", "Close Buffer" },
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["f"] = { "<cmd>lua require('user.custom-finders').find_from_project()<cr>", "Find Files" },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  ["p"] = { name = "Project",
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  },
  P = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  ["g"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
  e = { "<cmd>NvimTreeToggle<cr>", "File Explorer" },
  q = { "Quickfix" },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme {enable_preview=true}<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },
  t = {
    name = "Terminal",
    t = { "<cmd>ToggleTermToggleAll<cr>", "Toggle All" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=50 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
  T = {
    name = "Treesitter",
    u = { ":TSUpdate<cr>", "Update" },
    i = { ":TSConfigInfo<cr>", "Info" },
  },
  x = {
    name = "Trouble",
    x = { "<cmd>Trouble<cr>", "Trouble" },
    t = { "<cmd>TodoTrouble<cr>", "Todos" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
    l = { "<cmd>Trouble loclist<cr>", "Location List" },
    q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
    R = { "<cmd>Trouble lsp_references<cr>", "LSP References" },
  }
}

function CodeRunner()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
  local key_opts = { mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<localleader>" }

  if ft == "rust" or "toml" then
    wk.register(
      {
        name = "Rust",
        [','] = {'<cmd>TermExec cmd="cargo run"<cr>', "Run" },
        r = { "<cmd>RustLsp runnables<cr>", "Runnables" },
        t = { "<cmd>RustLsp testables<cr>", "Testables"},
        b = { "cmd>!cargo build<cr>", "Build" },
        u = { "<cmd>!cargo update<cr>", "Update" }
      }, key_opts)
  end
end

M.setup = function()
  wk.setup()
  wk.register(mappings, opts)
  vim.api.nvim_create_autocmd('Filetype', { pattern = { '*' }, command = "lua CodeRunner()" })
  vim.api.nvim_create_user_command('KeySetup', CodeRunner, {})
end

return M
