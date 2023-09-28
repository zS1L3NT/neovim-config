-- OneDark
require("onedark").load()

-- Telescope
local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
		file_ignore_patterns = {
			".git/",
			"node_modules/",
			"vendor/",
			"dist",
			"pnpm-lock.yaml",
		},
	},
})

vim.keymap.set("n", ";f", function()
	builtin.find_files({ no_ignore = false, hidden = true })
end)
vim.keymap.set("n", ";s", builtin.live_grep)
vim.keymap.set("n", ";d", builtin.diagnostics)

-- Alpha
require("alpha").setup(require("alpha.themes.dashboard").config)

-- LuaLine
require("lualine").setup()

-- Tree
require("nvim-tree").setup({
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		api.config.mappings.default_on_attach(bufnr)

		vim.keymap.set("n", "<C-O>", api.tree.change_root_to_node, opts("Open"))
		vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy"))
	end,
	diagnostics = {
		enable = true,
	},
	filters = {
		dotfiles = false,
	},
	update_cwd = true,
	update_focused_file = {
		enable = true,
	},
	view = {
		width = 50,
	},
})

vim.keymap.set("n", ";t", vim.cmd.NvimTreeToggle)
vim.o.fillchars = vim.o.fillchars .. "vert:▏"

-- Bufferline
local bufdelete = require("bufdelete")

require("bufferline").setup({
	options = {
		truncate_names = false,
		close_command = bufdelete.bufdelete,
		middle_click_command = bufdelete.bufdelete,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "Files",
				text_align = "center",
				separator = "▏",
			},
		},
		separator_style = "slant",
	},
})

vim.opt.termguicolors = true
vim.keymap.set("n", "<S-w>", bufdelete.bufdelete)
vim.keymap.set("n", "<S-l>", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<S-h>", vim.cmd.BufferLineCyclePrev)
