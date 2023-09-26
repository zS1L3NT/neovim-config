local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
    options = {
        truncate_names = false,
        close_command = ":bd %d|:bp",
        middle_click_command = ":bd %d|:bp",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function (count, level)
          local icon = level:match("error") and "? " or "? "
          return " " .. icon .. count
        end,
        offsets = {{
            filetype = "NvimTree",
            text = "Files",
            text_align = "center",
            separator = true,
        }},
        separator_style = "slant",
    }
})

vim.opt.termguicolors = true
vim.keymap.set("n", "<S-W>", ":bd %d|:bp<CR>")
vim.keymap.set("n", "<Tab>", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.BufferLineCyclePreo)
