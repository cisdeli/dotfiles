vim.g.mapleader = " "
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

-- Terminal window jumping remaps
vim.keymap.set("t", "<C-f>", "<C-\\><C-n>")
-- Move and Auto indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- CRTL D and U (half page jumping keeps cursor on the middle of screen)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keeps search terms on the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't lose highlighted after paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to systems clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Quickfix naviation (I don't know what that does really)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Remaping navigation keys on insert mode
vim.api.nvim_set_keymap('i', '<M-k>', '<Esc>:normal! k<CR>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<M-j>', '<Esc>:normal! j<CR>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<M-h>', '<Esc>:normal! h<CR>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<M-l>', '<Esc>:normal! l<CR>a', { noremap = true, silent = true })

-- Replace the word on cursor position
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chmod basically
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Map arrow keys to custom commands in normal mode
vim.keymap.set('n', '<Up>', ':echo "You pressed Up!"<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Down>', ':echo "You pressed Down!"<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Left>', ':echo "You pressed Left!"<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Right>', ':echo "You pressed Right!"<CR>', { noremap = true, silent = true })

-- Map arrow keys to custom commands in insert mode
vim.keymap.set('i', '<Up>', '<Esc>:echo "You pressed Up!"<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<Down>', '<Esc>:echo "You pressed Down!"<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<Left>', '<Esc>:echo "You pressed Left!"<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<Right>', '<Esc>:echo "You pressed Right!"<CR>', { noremap = true, silent = true })

-- Toggle terminal
vim.keymap.set('n', '<leader>tt', function() -- Open terminal
    local current_buf = vim.api.nvim_get_current_buf()
    local buf_type = vim.api.nvim_buf_get_option(current_buf, 'buftype')
    vim.cmd('terminal')
    vim.cmd('startinsert')
end, { noremap = true, silent = true })
vim.keymap.set('t', '<leader>tt', function() -- Close terminal
    local keys = vim.api.nvim_replace_termcodes([[<C-\><C-n>:b#<CR>]], true, false, true)
    vim.api.nvim_feedkeys(keys, 'n', false)
end, { noremap = true, silent = true })

-- Toggle Terminal and Run Python file.
vim.keymap.set('n', '<leader>tr', function()
    local current_buf = vim.api.nvim_get_current_buf()
    local buf_type = vim.api.nvim_buf_get_option(current_buf, 'buftype')

    if buf_type == 'terminal' then
        -- If in terminal, go back to previous buffer
        local keys = vim.api.nvim_replace_termcodes([[<C-\><C-n>:b#<CR>]], true, false, true)
        vim.api.nvim_feedkeys(keys, 'n', false)
    else
        -- If not in terminal, open terminal and run Python file
        local file_path = vim.api.nvim_buf_get_name(current_buf)
        vim.cmd('w') -- Save the current file
        vim.cmd('terminal python ' .. vim.fn.shellescape(file_path))
        vim.cmd('startinsert')
    end
end, { noremap = true, silent = true })
