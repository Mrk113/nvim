require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vim", "vimdoc", "html", "css", "typescript", "javascript", "c", "cpp", "python" },

    highlight = { enable = true },
    indent = { enable = true },
  })
