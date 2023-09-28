vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        requires = {
            { 'nvim-lua/plenary.nvim' }
        }
    }

    use 'navarasu/onedark.nvim'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'
    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },

            -- Autocompletion
            { 'onsails/lspkind.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-path' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    use "folke/neodev.nvim"

    use {
        "goolord/alpha-nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function() require "alpha".setup(require "alpha.themes.dashboard".config) end
    }

    use "lewis6991/gitsigns.nvim"

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    }

    use "mg979/vim-visual-multi"

    use "nvim-tree/nvim-tree.lua"
    use "akinsho/nvim-bufferline.lua"
    use "famiu/bufdelete.nvim"

    use "windwp/nvim-ts-autotag"
    use "windwp/nvim-autopairs"

    use "ray-x/lsp_signature.nvim"

    use "jose-elias-alvarez/null-ls.nvim"
    use "MunifTanjim/prettier.nvim"
    use "sbdchd/neoformat"

    use "lukas-reineke/indent-blankline.nvim"

    use "zbirenbaum/copilot.lua"
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function() require("copilot_cmp").setup() end,
    }
end)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"

vim.cmd([[au VimLeavePre * set guicursor=a:ver50]])

vim.g.mapleader = " "
--- J and K in visual mode move blocks of code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--- Keep cursor in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--- Disable copying when pasting
vim.keymap.set("x", "p", "\"_dp")
vim.keymap.set("x", "P", "\"_dP")

vim.keymap.set("n", "ƒ", vim.cmd.Neoformat)

vim.keymap.set("n", "<leader>tm", ":belowright split | resize 25 | terminal<CR> | i")
require("zS1L3NT.remap")
require("zS1L3NT.set")
