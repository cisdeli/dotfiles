require("lazy").setup({
    { 'rose-pine/neovim',                name = 'rose-pine' },
    { "EdenEast/nightfox.nvim" },
    { "nyoom-engineering/oxocarbon.nvim" },
    { "catppuccin/nvim",                 name = "catppuccin", priority = 1000 },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-treesitter/nvim-treesitter',        build = ':TSUpdate' },
    { 'folke/tokyonight.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',              branch = 'v3.x' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'jay-babu/mason-null-ls.nvim' },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
        },
    },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'm4xshen/autoclose.nvim' },
    { 'L3MON4D3/LuaSnip' },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    { 'mbbill/undotree' },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "letieu/harpoon-lualine",
        dependencies = {
            {
                "ThePrimeagen/harpoon",
                branch = "harpoon2",
            }
        },
    },
    { 'terrortylor/nvim-comment' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'sourcegraph/sg.nvim',
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    { 'github/copilot.vim' },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    {
        "goolord/alpha-nvim",
        lazy = true,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "https://github.com/lewis6991/gitsigns.nvim",
        lazy = true,
    },
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
        end
    }
})
