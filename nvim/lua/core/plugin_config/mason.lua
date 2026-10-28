-- Mason
local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')

-- Project venv (uv's .venv in the root), else the activated one
local function venv(root)
    for _, dir in ipairs({ root and root .. "/.venv", vim.env.VIRTUAL_ENV }) do
        if dir and vim.fn.executable(dir .. "/bin/python") == 1 then
            return dir
        end
    end
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
        pyright = function()
            lspconfig.pyright.setup({
                on_new_config = function(config, root)
                    local env = venv(root)
                    if env then
                        config.settings.python.pythonPath = env .. "/bin/python"
                    end
                end,
            })
        end,
        pylsp = function()
            lspconfig.pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            -- formatter options
                            black = { enabled = true },
                            autopep8 = { enabled = false },
                            -- linter options
                            -- pylint = { enabled = true, executable = "pylint" },
                            -- pyflakes = { enabled = false },
                            -- E501 line length is black's job, the rest are pycodestyle's defaults
                            pycodestyle = { ignore = { "E501", "E121", "E123", "E126", "E226", "E24", "E704", "W503", "W504" } },
                            -- type checker
                            -- pylsp_mypy = { enabled = true },
                            -- auto-completion options
                            jedi_completion = { fuzzy = true },
                        },
                    },
                },
                on_new_config = function(config, root)
                    local env = venv(root)
                    if env then
                        config.settings.pylsp.plugins.jedi = { environment = env }
                    end
                end,
            })
        end,
        jedi_language_server = function()
            lspconfig.jedi_language_server.setup({
                on_new_config = function(config, root)
                    local env = venv(root)
                    if env then
                        config.init_options = { workspace = { environmentPath = env .. "/bin/python" } }
                    end
                end,
            })
        end,
    },
})

require("mason-null-ls").setup({
    ensure_installed = { "black", "clang_format"}
})
