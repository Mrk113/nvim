--Options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.cursorline = true 

vim.opt.wrap = false
vim.opt.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus"


--Keybinds
-- Move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Autocommands
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
-- Highlight yanked text
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 170 })
    end,
    group = highlight_group,
})

--Plugins
local gh = function(x) return 'https://github.com/' .. x end
vim.pack.add({
    --Syntax Highligthing
    { src = gh('nvim-treesitter/nvim-treesitter') },
    --LSP
    { src = gh('williamboman/mason.nvim') },
    { src = gh('neovim/nvim-lspconfig') },
    { src = gh('mason-org/mason-lspconfig.nvim') },
    --Auto Complete
    { src = gh('hrsh7th/nvim-cmp') },
    { src = gh('hrsh7th/cmp-nvim-lsp') },
    { src = gh('hrsh7th/cmp-buffer') },
    { src = gh('hrsh7th/cmp-path') },
    { src = gh('windwp/nvim-autopairs') },
    --Colortheme
    { src = gh('catppuccin/nvim') },
    --Statusbar
    { src = gh('nvim-lualine/lualine.nvim') },
    --Windowing
    { src = gh('nvim-lua/plenary.nvim') },
    { src = gh('nvim-telescope/telescope.nvim') },
    { src = gh('ThePrimeagen/harpoon'), version = "harpoon2" },
})

--Syntax Highligthing
require("nvim-treesitter").setup({})

--LSP
require("mason").setup({})
require("mason-lspconfig").setup({})
vim.diagnostic.config({
  virtual_text = true,
})

--Auto Complete
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-f>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})
require("nvim-autopairs").setup({})

--Colortheme
vim.cmd.colorscheme("catppuccin")

--Statusbar
require("lualine").setup({})

--Windowing
require("telescope").setup({})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })

local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)

vim.keymap.set("n", "<leader>h", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
