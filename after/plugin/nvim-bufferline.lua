local status, bufferline = pcall(require, "bufferline")
local status_, bufdelete = pcall(require, "bufdelete")
if (not status) then return end
if (not status_) then return end

bufferline.setup({
    options = {
        truncate_names = false,
        close_command = bufdelete.bufdelete,
        middle_click_command = bufdelete.bufdelete,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function (count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        offsets = {{
            filetype = "NvimTree",
            text = "Files",
            text_align = "center",
            separator = "▏",
        }},
        separator_style = "slant",
    }
})

vim.opt.termguicolors = true
vim.keymap.set("n", "<S-W>", bufdelete.bufdelete)
vim.keymap.set("n", "<Tab>", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.BufferLineCyclePrev)
