return {
    { "nvim-tree/nvim-web-devicons" },
    { "ibhagwan/fzf-lua" },
    { "sputnick1124/uiua.vim" },
    { "catppuccin/vim",              as = "catpuccin" },
    { "rose-pine/neovim",            as = "rose-pine" },
    { "marko-cerovac/material.nvim", as = "material" },
    {
        "folke/tokyonight.nvim",
        as = "tokyo-night",
        priority = 1000,
        opts = {},
    },
    { "neanias/everforest-nvim" },
    { "towolf/vim-helm" },
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    { "nvim-treesitter/playground",      run = ":TSUpdate" },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-rhubarb" },
    { "tpope/vim-commentary" },

    { "hrsh7th/cmp-nvim-lsp" },
    { "neovim/nvim-lspconfig" },
    { "mhartington/formatter.nvim" },
    { "bakpakin/janet.vim" },
    { "mason-org/mason.nvim", opts = {} },

    { "folke/trouble.nvim" },
    { "folke/which-key.nvim" },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        lazy = false,
    },
    { "ThePrimeagen/harpoon" }
}
