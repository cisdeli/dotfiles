local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.formatting.beautysh
    },
})
