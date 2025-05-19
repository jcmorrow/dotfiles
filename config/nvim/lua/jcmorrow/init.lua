require("jcmorrow.packer")
require("jcmorrow.set")
require("jcmorrow.remap")
vim.cmd([[
  autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif
]])

local function is_macOS_dark_mode()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  return result and string.find(result, "Dark")
end

if is_macOS_dark_mode() then
  vim.cmd([[colorscheme everforest]])
  vim.cmd("set background=dark")
  -- vim.cmd([[colorscheme rose-pine-moon]])
else
  vim.cmd("set background=light")
  -- vim.cmd([[colorscheme rose-pine-dawn]])
  vim.cmd([[colorscheme everforest]])
end

vim.cmd("highlight! link MatchParen Cursor")
