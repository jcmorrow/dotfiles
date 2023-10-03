require("jcmorrow.packer")
require("jcmorrow.set")
require("jcmorrow.remap")
vim.cmd([[
  autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif
]])
