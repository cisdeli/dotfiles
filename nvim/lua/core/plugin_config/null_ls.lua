local null_ls = require("null-ls")

local glslang = {
    name = "glslangValidator",
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "glsl" },
    generator = null_ls.generator({
        command = "glslangValidator",
        args = { "$FILENAME" },
        -- temp file keeps the original extension, so the shader stage
        -- (.frag/.vert/.comp/...) is still inferred from the name
        to_temp_file = true,
        from_stderr = false, -- glslangValidator reports on stdout
        format = "line",
        check_exit_code = function(code)
            return code <= 2
        end,
        on_output = function(line)
            local severity, row, message = line:match("^(%u+): %d+:(%d+): (.*)$")
            if not severity then
                return nil
            end
            -- follow-up noise emitted after the real error
            if message:match("compilation terminated") then
                return nil
            end
            return {
                row = tonumber(row),
                message = vim.trim(message),
                severity = severity == "ERROR" and vim.diagnostic.severity.ERROR
                    or vim.diagnostic.severity.WARN,
            }
        end,
    }),
}

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format.with({
            filetypes = { "c", "cpp", "cs", "cuda", "proto", "objc", "objcpp", "glsl" },
        }),
        null_ls.builtins.formatting.prettier,
        glslang,
    },
})
