local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
    "lua_ls",
    "tsserver",
    "eslint",
    "rust_analyzer",
})

lsp.setup()
