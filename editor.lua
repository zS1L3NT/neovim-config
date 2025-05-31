-- Code Action Menu
vim.keymap.set("n", "<leader>f", vim.cmd.CodeActionMenu)

-- Git Signs
require("gitsigns").setup()

-- TypeScript Auto Tag
require("nvim-ts-autotag").setup()

-- Auto Pairs
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

-- Null LS
local null_ls = require("null-ls")

null_ls.setup()

-- Prettier
require("prettier").setup({
	bin = "prettierd",
	filetypes = {
		"css",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"scss",
		"less",
	},
})

-- Indent Blankline
require("ibl").setup({
	char = "▏",
	scope = {
		enabled = false,
	},
})

-- Hover
local hover = require("hover")

hover.setup({
	init = function()
		require("hover.providers.lsp")
	end,
	preview_opts = {
		border = "rounded",
	},
	preview_window = false,
	title = true,
})

vim.keymap.set("n", "K", hover.hover, { desc = "hover.nvim" })
vim.keymap.set("n", "gK", hover.hover_select, { desc = "hover.nvim (select)" })
