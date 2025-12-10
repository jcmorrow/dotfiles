vim.g.mapleader = " "

if vim.fn.executable("fish") == 1 then
  vim.opt.shell = "fish"
end

vim.opt.termguicolors = true

vim.opt.guicursor = ""
vim.opt.scrolloff = 8

vim.opt.number = false
vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.colorcolumn = "80"

vim.cmd("set list listchars=tab:»·,trail:·,nbsp:·")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50
vim.opt.clipboard = "unnamed"

vim.opt.showmatch = true
