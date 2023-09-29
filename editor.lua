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
})

-- Copilot
require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})
