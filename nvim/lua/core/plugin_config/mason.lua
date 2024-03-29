-- Mason
local lsp_zero = require('lsp-zero')
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
})

require("mason-null-ls").setup({
    ensure_installed = { "black", "clang_format"}
})
