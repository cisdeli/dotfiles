require("lazy").setup({
    { 'rose-pine/neovim', name = 'rose-pine' },
    { "catppuccin/nvim",  name = "catppuccin", priority = 1000 },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-treesitter/nvim-treesitter',     build = ':TSUpdate' },
    { 'folke/tokyonight.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',           branch = 'v3.x' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'jay-babu/mason-null-ls.nvim' },
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",       opts = {} },
    { 'mbbill/undotree' },
    { 'theprimeagen/harpoon' },
    { 'terrortylor/nvim-comment' },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    }
})
