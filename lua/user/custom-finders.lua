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

return M
