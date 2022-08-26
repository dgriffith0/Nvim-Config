local M = {}

local _, themes = pcall(require, "telescope.themes")
local _, builtin = pcall(require, "telescope.builtin")

function M.find_config_files(opts)
  opts = opts or {}
  local theme_opts = themes.get_ivy {
    sorting_strategy = "ascending",
    layout_strategy = "bottom_pane",
    prompt_prefix = ">> ",
    prompt_title = "~ Nvim Config Files",
    cwd = get_config_dir()
    -- search_dirs = { utils.join_paths(get_runtime_dir(), "lvim"), lvim.lsp.templates_dir },
  }
opts = vim.tbl_deep_extend("force", theme_opts, opts)
builtin.find_files(opts)
end

M.find_from_project = function(opts)
  opts = opts or {}
  opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    -- if not git then active lsp client root
    -- will get the configured root directory of the first attached lsp. You will have problems if you are using multiple lsps 
    opts.cwd = vim.lsp.get_active_clients()[1].config.root_dir
  end
  builtin.find_files(opts)
end

return M
