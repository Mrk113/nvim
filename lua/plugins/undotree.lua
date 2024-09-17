return {
  "mbbill/undotree",
  config = function ()
    vim.keymap.set('n', '<D-u>', function ()
      vim.cmd.UndotreeToggle()
      vim.cmd.UndotreeFocus()
    end)
  end
}
