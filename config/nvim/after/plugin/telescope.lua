local builtin = require("telescope.builtin")

require("telescope").setup({
  defaults = {

    mappings = {
      i = {
        -- I am not sure why these are not working???
        -- ["<C-h>"] = "results_scrolling_left",
        ["<C-k>"] = "move_selection_previous",
        ["<C-j>"] = "move_selection_next",
        -- ["<C-l>"] = "results_scrolling_right",
      },
    },
  },
})

vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>F", builtin.git_files, {})
vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
vim.keymap.set("n", "<leader>l", builtin.resume, {})

vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
