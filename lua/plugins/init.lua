local plugins = {
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  -- Colorschemes
  { 'folke/tokyonight.nvim' },
  { "ellisonleao/gruvbox.nvim" },
  {
    "catppuccin/nvim",
    as = "catppuccin"
  },
  -- Alpha / Dashboard
  {
    "goolord/alpha-nvim",
    config = function()
      require("user.alpha").setup()
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
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
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("user.todo").setup()
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('user.lualine').setup()
    end
  },
  {
    'numToStr/Comment.nvim',
    event = "BufRead",
    config = function()
      require('Comment').setup()
    end
  },
  -- Completions
  { "lukas-reineke/cmp-under-comparator" },
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
  { 'williamboman/mason-lspconfig.nvim' },
  { 'nvim-lua/lsp-status.nvim' },
  -- snippets
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },

  -- language parser / highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('user.treesitter').setup()
    end
  },
  -- Telescope Add-ons
  --Tree Sitter Add-ons
  { 'RRethy/nvim-treesitter-endwise' },
  { 'p00f/nvim-ts-rainbow' },
  -- Debugging
  { 'mfussenegger/nvim-dap',
    -- event = "BufWinEnter",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require('dapui').setup()
    end
  },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('user.nvim-tree').setup()
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require('trouble').setup()
    end
  },
  {
    "akinsho/toggleterm.nvim",
    version = "v2.*",
    event = "BufWinEnter",
    config = function()
      require('user.toggleterm').setup()
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
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   ft = { "markdown" },
  --   build = function() vim.fn["mkdp#util#install"]() end,
  -- }

}

return plugins
