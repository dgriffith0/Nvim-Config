local plugins = {

  -- My plugins here
  { "wbthomason/packer.nvim" },
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "goolord/alpha-nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "folke/which-key.nvim" },
  { 'hrsh7th/nvim-cmp' },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  },
  { 'numToStr/Comment.nvim' },
  --
  -- Colorschemes
  { 'folke/tokyonight.nvim' },
  { "ellisonleao/gruvbox.nvim" },

  -- Completions
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { "saadparwaiz1/cmp_luasnip" },

  --lsp
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { "williamboman/mason.nvim" },
  { 'jose-elias-alvarez/null-ls.nvim' },
  { 'nvim-lua/lsp-status.nvim' },

  -- snippets
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },

  -- language parser / highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },

  -- Telescope Add-ons
  { "ahmedkhalf/project.nvim" },

  --Tree Sitter Add-ons
  { "windwp/nvim-autopairs" },
  { 'RRethy/nvim-treesitter-endwise' },
  { 'p00f/nvim-ts-rainbow' },

  -- Debugging
  { 'mfussenegger/nvim-dap' },

  -- Rust
  { 'simrat39/rust-tools.nvim' },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  },
  { "akinsho/toggleterm.nvim", tag = 'v2.*' },
  { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' },
  { 'rcarriga/nvim-notify' },
  {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }
}

return plugins
