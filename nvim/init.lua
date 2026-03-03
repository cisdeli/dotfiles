vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim-venv/bin/python")
-- local venv_bin = vim.fn.expand("~/.local/share/nvim-venv/bin")
-- vim.env.PATH = venv_bin .. ":" .. vim.env.PATH

local env = os.getenv("UV_PROJECT_ENVIRONMENT")
if env and env ~= "" then
  vim.env.PATH = env .. "/bin:" .. vim.env.PATH
end

if vim.g.vscode then
    -- VSCode extension
    require("core.remap")
else
    -- ordinary Neovim
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
    require("core.remap")
    require("core.set")
    require("core.filetypes")
    require("core.plugins")
    require("core.plugin_config")
end
