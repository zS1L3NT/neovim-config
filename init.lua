vim.cmd([[packadd packer.nvim]])

-- Packer
require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Editor
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use("lewis6991/gitsigns.nvim")
	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")
	use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/prettier.nvim")
	use("sbdchd/neoformat")
	use("lukas-reineke/indent-blankline.nvim")
	use("zbirenbaum/copilot.lua")
	use({
		"zbirenbaum/copilot-cmp",
		after = "copilot.lua",
		config = function()
			require("copilot_cmp").setup()
		end,
	})

	-- UI
	use("navarasu/onedark.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use("nvim-tree/nvim-tree.lua")
	use("akinsho/nvim-bufferline.lua")
	use("famiu/bufdelete.nvim")

	-- LSP
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Autocompletion
			"onsails/lspkind.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
		},
	})
	use("ray-x/lsp_signature.nvim")
end)

-- Globals
vim.g.mapleader = " "

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

vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "p", '"_dp')
vim.keymap.set("x", "P", '"_dP')

vim.keymap.set("n", "ƒ", vim.cmd.Neoformat)

vim.keymap.set("n", "<leader>tm", ":belowright split | resize 25 | terminal<CR> | i")

vim.cmd([[au VimLeavePre * set guicursor=a:ver50]])

require("lsp")
require("ui")
require("editor")
