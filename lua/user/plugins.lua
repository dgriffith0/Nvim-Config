local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "goolord/alpha-nvim" -- Startup Dashboard
  use "ellisonleao/gruvbox.nvim" -- Color scheme
  use "nvim-telescope/telescope.nvim" -- Grep Searching
  use "folke/which-key.nvim" -- Leader key menu
  use 'hrsh7th/nvim-cmp' -- Auto complete
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'numToStr/Comment.nvim' --GCC Comments

  -- Completions
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  --lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use "williamboman/mason.nvim"
  use 'jose-elias-alvarez/null-ls.nvim'

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  --language parser / highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Telescope Add-ons
  use "ahmedkhalf/project.nvim"

  --Tree Sitter Add-ons
  use "windwp/nvim-autopairs"
  use 'RRethy/nvim-treesitter-endwise'
  use 'p00f/nvim-ts-rainbow'

  -- Debugging
  use 'mfussenegger/nvim-dap'

  -- Rust
  use 'simrat39/rust-tools.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use { "akinsho/toggleterm.nvim", tag = 'v2.*' }
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
