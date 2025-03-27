local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- ['<C-o>'] = cmp.mapping.complete(),
        ['<C-x>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vim_lsp' },
        { name = 'luasnip' },
        { name = 'copilot' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    }),
})

-- I dont know if this is doing anything
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup {
    capabilities = capabilities,
}
require('lspconfig').pylsp.setup {
    pylsp = {
        plugins = {
            -- formatter options
            black = { enabled = true },
            autopep8 = { enabled = false },
            -- linter options
            -- pylint = { enabled = true, executable = "pylint" },
            -- pyflakes = { enabled = false },
            -- pycodestyle = { enabled = false },
            -- type checker
            -- pylsp_mypy = { enabled = true },
            -- auto-completion options
            jedi_completion = { fuzzy = true },
            -- import sorting
            -- pyls_isort = { enabled = true },
        },
    },

    capabilities = capabilities,
}
