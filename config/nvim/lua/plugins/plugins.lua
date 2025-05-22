return {
  { "nvim-tree/nvim-web-devicons" },
  { "ibhagwan/fzf-lua" },
  { "sputnick1124/uiua.vim" },
  { "catppuccin/vim", as = "catpuccin" },
  { "rose-pine/neovim", as = "rose-pine" },
  { "junegunn/seoul256.vim" },
  { "neanias/everforest-nvim" },
  { "towolf/vim-helm" },
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  { "nvim-treesitter/playground", run = ":TSUpdate" },
  { "mbbill/undotree" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "tpope/vim-commentary" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
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
  { "ThePrimeagen/harpoon" },
}
