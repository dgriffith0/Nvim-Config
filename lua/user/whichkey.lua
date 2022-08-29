local M = {}

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  -- ["/"] = { "<cmd>lua require(\"Comment.api\").toggle_current_linewise()<CR>", "Comment" },
  ["r"] = { "<cmd>lua reload_nvim_conf()<cr>", "Reload" },
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers()<cr>",
    "Buffers",
  },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["c"] = { "<cmd>bp|bd #<CR>", "Close Buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  -- ["f"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
  ["f"] = { "<cmd>lua require('user.custom-finders').find_from_project()<cr>", "Find Files" },
  -- ["f"] = {
  --   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
  --   "Find files",
  -- },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  ["p"] = { "<cmd>Telescope projects<cr>", "Projects" },

  P = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  ["g"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
  --
  -- g = {
  --   name = "Git",
  --   g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
  --   j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
  --   k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
  --   l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
  --   p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
  --   r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
  --   R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
  --   s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  --   u = {
  --     "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
  --     "Undo Stage Hunk",
  --   },
  --   o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  --   b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  --   c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  --   d = {
  --     "<cmd>Gitsigns diffthis HEAD<cr>",
  --     "Diff",
  --   },
  -- },
  --
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
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  t = {
    name = "Terminal",
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  x = {
    name = "Trouble",
    x = { "<cmd>Trouble<cr>", "Trouble" },
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
  -- local fname = vim.fn.expand "%:p:t" (useful for using filenames e.g. package.json)
  local keymap = {}

  if ft == "dart" then
    keymap = {
      name = "Flutter",
      [','] = { "<cmd>FlutterRun -t path/to/main<cr>", "Run" },
      m = { "<cmd>!melos --setup<cr>", "Melos" },
    }
  end

  if ft == "rust" or "toml" then
    keymap = {
      name = "Rust",
      [','] = { "<cmd>!cargo run<cr>", "Run" },
      u = { "<cmd>!cargo update<cr>", "Update" }
    }
  end

  if next(keymap) ~= nil then
    wk.register(
      { [','] = keymap },
      { mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>" }
    )
  end
end

M.setup = function()
  wk.setup()

  wk.register(mappings, opts)

  vim.api.nvim_create_autocmd('FileType', { pattern = { '*' }, command = "lua CodeRunner()" })

end

return M
