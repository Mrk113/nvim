local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- Setup language servers
local lspconfig = require "lspconfig"

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
}

-- setup multiple servers with same default options
local servers = require('configs.ls')

for _, lsp in ipairs(servers) do
  if lsp ~= "lua_ls" then
    lspconfig[lsp].setup {
      capabilities = capabilities,
    }
  end
end
