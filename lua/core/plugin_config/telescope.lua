-- Telescope mappings
require('telescope').setup({ file_ignore_patterns = { "node%_modules/.*" } })
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
