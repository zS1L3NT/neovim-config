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
