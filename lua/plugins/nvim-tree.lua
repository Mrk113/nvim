return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
      "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      vim.keymap.set("n", "<C-s>", "<cmd> NvimTreeToggle <CR>"),
      vim.keymap.set("n", "<C-f>", "<cmd> NvimTreeFocus <CR>"),

    })
  end,
}
