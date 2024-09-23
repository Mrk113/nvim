return {
  "mbbill/undotree",
  config = function ()
    vim.keymap.set('n', '<C-u>', function ()
      vim.cmd.UndotreeToggle()
      vim.cmd.UndotreeFocus()
    end)
  end
}
