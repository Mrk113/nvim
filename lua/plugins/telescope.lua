return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    local map = vim.keymap.set
    local builtin = require("telescope.builtin")

    map('n', '<space>ff', builtin.find_files, {})
    map('n', '<space>fg', builtin.live_grep, {})
    map('n', '<space>fb', builtin.buffers, {})
    map('n', '<space>fh', builtin.help_tags, {})
  end
}
