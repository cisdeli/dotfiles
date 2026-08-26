local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format.with({
            filetypes = { "c", "cpp", "cs", "cuda", "proto", "objc", "objcpp", "glsl" },
        }),
        null_ls.builtins.formatting.prettier,
    },
})
