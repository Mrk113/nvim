return {
  "tpope/vim-commentary",
  config = function ()
    vim.keymap.set("n", "<space>.", "gcc", { remap = true })
    vim.keymap.set("v", "<space>.", "gc", { remap = true })
  end
}
