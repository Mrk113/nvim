return {
  {
    "williamboman/mason.nvim",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup({
        handlers = {},
      })

      local servers = require("configs.ls")

      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })
    end,
  },
}
