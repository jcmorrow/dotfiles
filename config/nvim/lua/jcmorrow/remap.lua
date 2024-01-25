local vim = vim
vim.keymap.set("n", "<C-n>", function()
  pcall(vim.cmd.Neotree, "toggle")
end)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- keep page up/down in the middle of the screen
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- keep search matches in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

-- ctrl-k go to next error
-- ctrl-j go to previous error
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- space space go to previous buffer
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- space s replace all instances of word under cursor
vim.keymap.set(
  "n",
  "<leader>s",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>"
)
