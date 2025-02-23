-- Only required if you have packer configured as `opt`
local vim = vim
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use({
    "ibhagwan/fzf-lua",
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  use({ "sputnick1124/uiua.vim" })

  use({ "catppuccin/vim", as = "catpuccin" })
  use({ "rose-pine/neovim", as = "rose-pine" })
  use({ "marko-cerovac/material.nvim", as = "material" })
  use({
    "folke/tokyonight.nvim",
    as = "tokyo-night",
    lazy = false,
    priority = 1000,
    opts = {},
  })
  use({ "embark-theme/vim", as = "embark" })
  use({ "neanias/everforest-nvim", as = "everforest" })
  use({ "EdenEast/nightfox.nvim", as = "nightfox" })

  use({ "towolf/vim-helm" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "nvim-treesitter/playground", run = ":TSUpdate" })
  use({ "mbbill/undotree" })
  use({ "tpope/vim-fugitive" })
  use({ "tpope/vim-rhubarb" })
  use({ "tpope/vim-commentary" })
  use({ "junegunn/goyo.vim" })

  use({ "mhartington/formatter.nvim" })
  use({ "bakpakin/janet.vim" })

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {
        -- Optional
        "williamboman/mason.nvim",
        run = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },     -- Required
    },
  })

  -- use({
  --   "ray-x/navigator.lua",
  --   requires = {
  --     { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
  --     { "neovim/nvim-lspconfig" },
  --   },
  -- })

  use({ "folke/trouble.nvim" })
  use({ "folke/which-key.nvim" })

  use({
    "nvim-neo-tree/neo-tree.nvim",
    as = "neo-tree",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  })

  use({ "ThePrimeagen/harpoon" })
end)
