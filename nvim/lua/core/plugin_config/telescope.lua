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
<<<<<<< HEAD
=======
                "-g",
                "!**/.cache/*",
                "-g",
                "!**/*.out",
>>>>>>> 822ba7eb77ae7946020d1c73f540f455c1923e3f
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

require("telescope").load_extension("ui-select")
