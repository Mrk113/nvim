require("mason").setup()

local servers = require("configs.ls")

require("mason-lspconfig").setup({
    ensure_installed = servers
})
