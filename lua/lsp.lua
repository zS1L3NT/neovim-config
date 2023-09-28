-- Treesitter
require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"javascript",
		"typescript",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"html",
		"css",
		"yaml",
		"json",
		"php",
		"fish",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,
	},
})

-- LSP Zero
local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(_, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({ buffer = bufnr })
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
	"lua_ls",
	"tsserver",
	"eslint",
	"rust_analyzer",
})

lsp.setup()

-- CMP
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local lspkind = require("lspkind")

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-CR>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp_action.tab_complete(),
		["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
	}),
	sources = cmp.config.sources({
		{ name = "copilot", group_index = 2 },
		{ name = "path", group_index = 2 },
		{ name = "nvim_lsp", group_index = 2 },
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
	formatting = {
		fields = {
			cmp.ItemField.Kind,
			cmp.ItemField.Abbr,
			cmp.ItemField.Menu,
		},
		format = lspkind.cmp_format({
			mode = "symbol_text",
			symbol_map = {
				Copilot = "",
			},
		}),
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig")["tsserver"].setup({
	capabilities = capabilities,
})

-- LSP Signature
require("lsp_signature").setup({
	bind = true,
	fix_pos = true,
})
