return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
          require("plugins.treesitter")
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "moon"},
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lspconfig")
    end,
  },

  {
    "williamboman/mason.nvim",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("plugins.mason")
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("plugins.nvim-tree")
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("plugins.lualine")
    end,
  },

  {
    'nvim-lua/plenary.nvim',
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
     dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufReadPre" },
    main = "ibl",
    config = function()
      require("plugins.indent-blankline")
    end,
  },

  {
    "mbbill/undotree",
  },

  {
    "tpope/vim-commentary",
  },

  {
    "ThePrimeagen/harpoon",
  },

  -- Code completion and snippets
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- cmp sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",

      --list of default snippets
      "rafamadriz/friendly-snippets",

      -- snippets engine
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },

      -- autopairs , autocompletes ()[] etc
      {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup()

          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          local cmp = require "cmp"
          cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
    },
    -- made opts a function cuz cmp config calls cmp module
    -- and we lazyloaded cmp so we dont want that file to be read on startup!
    opts = function()
      return require "plugins.nvim-cmp"
    end,
  },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    priority = 1000,
    config = function()
      require('plugins.dashboard')
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
}
