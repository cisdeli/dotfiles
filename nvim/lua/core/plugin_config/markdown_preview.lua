-- Markdown Preview
vim.g.mkdp_browser = "explorer.exe" -- open in the Windows browser from WSL
vim.g.mkdp_echo_preview_url = 1
vim.keymap.set("n", "<leader>mp", vim.cmd.MarkdownPreviewToggle)
