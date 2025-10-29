-- Telescope mappings
require('telescope').setup({
    pickers = {
        find_files = {
            find_command = {
                "rg",
                "--no-ignore",
                "--hidden",
                "--files",
                "-g",
                "!**/node_modules/*",
                "-g",
                "!**/.git/*",
                "-g",
                "!**/.tmux/*",
                "-g",
                "!**/target/debug/*",
                "-g",
                "!**/CMakeFiles/*",
                "-g",
                "!**/.cache/*",
                "-g",
                "!**/*.out",
                "-g",
                "!**/.next/*",
                "-g",
                "!**/out/*",
                "-g",
                "!**/*.pyc",
                "-g",
                "!**/*.venv",
                "-g",
                "!**/*_deps",
            },
        },
    },
    extensions = {
        file_browser = {
            hidden = { file_browser = true, folder_browser = true },
            prompt_path = true,
        },
    },
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("telescope").load_extension("ui-select")
