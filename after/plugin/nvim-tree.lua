vim.keymap.set("n", "<leader>pt", vim.cmd.NvimTreeToggle)

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
    update_cwd = true,
    update_focused_file = {
        enable = true,
    },
})
