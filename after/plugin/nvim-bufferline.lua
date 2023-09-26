local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({})

vim.keymap.set("n", "<Tab>", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.BufferLineCyclePrev)

