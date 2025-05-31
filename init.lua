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
	use("christoomey/vim-tmux-navigator")
	use("lewis6991/hover.nvim")

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
    -- use("akinsho/nvim-bufferline.lua")
	use("famiu/bufdelete.nvim")

	-- LSP
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-path")
	use("onsails/lspkind.nvim")
	use("L3MON4D3/LuaSnip")
end)

dofile("/Users/mac/.config/nvim/lsp.lua")
dofile("/Users/mac/.config/nvim/ui.lua")
dofile("/Users/mac/.config/nvim/editor.lua")

local TRANSPARENCY = 10

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#292C33", blend = TRANSPARENCY })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.opt.pumblend = TRANSPARENCY
vim.opt.winblend = TRANSPARENCY

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

-- function NvimTreeOpenAndNextBuffer()
--     vim.cmd([[NvimTreeOpen]])
--     if not string.find(vim.api.nvim_command_output("buffers"), "No Name") then
--         vim.cmd([[bnext]])
--     end
-- end

vim.cmd([[au VimLeavePre * set guicursor=a:ver50]])

vim.api.nvim_create_user_command("Reload", "source ~/.config/nvim/init.lua", {})
vim.cmd("cnoreabbrev rl Reload")

-- NvimTreeOpenAndNextBuffer()
