vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
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

            -- Autocompletion
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
end)
