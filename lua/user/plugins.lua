local plugins = {
  { 'kyazdani42/nvim-web-devicons' },
  -- { "lewis6991/impatient.nvim" },
  { "wbthomason/packer.nvim" },
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  -- Colorschemes
  { 'folke/tokyonight.nvim'},
  { "ellisonleao/gruvbox.nvim" },
  -- Alpha / Dashboard
  {
    "goolord/alpha-nvim",
    config = function()
      require("user.alpha").setup()
    end
  },
  { "nvim-telescope/telescope.nvim",
    config = function()
      require('user.telescope').setup()
    end
  },
  {
    "folke/which-key.nvim",
    event = "BufWinEnter",
    config = function()
      require('user.whichkey').setup()
    end
  },
  { 'hrsh7th/nvim-cmp',
    config = function()
      require('user.cmp').setup()
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons'},
    config = function()
      require('user.lualine').setup()
    end
  },
  { 'numToStr/Comment.nvim',
    event = "BufRead",
    config = function()
      require('Comment').setup()
    end
  },
  -- Completions
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { "saadparwaiz1/cmp_luasnip" },

  --lsp
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  {
    "williamboman/mason.nvim",
    config = function()
      require('user.mason').setup()
    end
  },
  {'williamboman/mason-lspconfig.nvim'},
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('user.null-ls').setup()
    end
  },
  { 'nvim-lua/lsp-status.nvim' },
  -- snippets
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },

  -- language parser / highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require('user.treesitter').setup()
    end
  },
  -- Telescope Add-ons
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require('user.project').setup()
    end
  },
  --Tree Sitter Add-ons
  {
    "windwp/nvim-autopairs",
    config = function()
      require "user.autopairs".setup()
    end
  },
  { 'RRethy/nvim-treesitter-endwise' },
  { 'p00f/nvim-ts-rainbow' },
  -- Debugging
  { 'mfussenegger/nvim-dap',
    -- event = "BufWinEnter",
  },
  { "rcarriga/nvim-dap-ui", 
    requires = {"mfussenegger/nvim-dap"},
    config = function() 
      require('dapui').setup()
    end
  },
  -- Rust
  { 'simrat39/rust-tools.nvim',
    config = function()
      require('user.rust').setup()
    end
  },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('user.nvim-tree').setup()
    end
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require('trouble').setup()
    end
  },
  {
    "akinsho/toggleterm.nvim", tag = 'v2.*',
    event = "BufWinEnter",
    config = function()
      require('user.toggleterm').setup()
    end
  },
  { 'akinsho/flutter-tools.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('user.flutter').setup()
    end
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup()
    end
  },
  {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function ()
      vim.schedule(function()
        require("copilot").setup()
      end)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  }
}

return plugins
