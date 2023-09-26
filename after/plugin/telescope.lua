local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
    },
})

vim.keymap.set('n', ';f', function() builtin.find_files({ no_ignore = false, hidden = true }) end)
vim.keymap.set('n', ';s', builtin.live_grep)
vim.keymap.set('n', ';d', builtin.diagnostics)

