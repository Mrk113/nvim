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

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Move selected lines up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

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
    { src = gh('ThePrimeagen/harpoon'),           version = "harpoon2" },
})

--Syntax Highligthing
require("nvim-treesitter").setup()

--LSP
require("mason").setup()
require("mason-lspconfig").setup(
    {
        ensure_installed = {
            "lua_ls",
            "clangd",
        }
    }
)

vim.diagnostic.config({
    virtual_text = true,
})

map("n", "<leader>fm", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer (LSP)" })


-- Navigation
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "gt", vim.lsp.buf.type_definition, opts)

-- Info
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<C-k>", vim.lsp.buf.signature_help, opts)

-- Refactor
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

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
require("nvim-autopairs").setup()

--Colortheme
vim.cmd.colorscheme("catppuccin")

--Statusbar
require("lualine").setup({})

--Windowing
require("telescope").setup({})

local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help" })

local harpoon = require("harpoon")

map("n", "<leader>a", function()
    harpoon:list():add()
end)

map("n", "<leader>h", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

map("n", "<leader>1", function() harpoon:list():select(1) end)
map("n", "<leader>2", function() harpoon:list():select(2) end)
map("n", "<leader>3", function() harpoon:list():select(3) end)
map("n", "<leader>4", function() harpoon:list():select(4) end)
