local fzf = require("fzf-lua")
fzf.setup({
  "telescope",
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = "move_selection_previous",
        ["<C-j>"] = "move_selection_next",
      },
    },
  },
})

vim.keymap.set("n", "<leader>f", fzf.files, {})
vim.keymap.set("n", "<leader>F", fzf.git_files, {})
vim.keymap.set("n", "<leader>/", fzf.live_grep, {})
vim.keymap.set("n", "<leader>b", fzf.buffers, {})
vim.keymap.set("n", "<leader>h", fzf.help_tags, {})
vim.keymap.set("n", "<leader>l", fzf.resume, {})

vim.keymap.set("n", "<leader>h", fzf.help_tags, {})

require("nvim-web-devicons").setup()
