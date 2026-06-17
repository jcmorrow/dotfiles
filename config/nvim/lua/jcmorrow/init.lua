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

-- if is_macOS_dark_mode() then
--   vim.cmd("set background=dark")
--   vim.cmd([[colorscheme rose-pine-moon]])
-- else
--   vim.cmd("set background=light")
--   vim.cmd([[colorscheme rose-pine-dawn]])
-- end
--
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

-- vim.cmd([[colorscheme tokyonight]])
vim.cmd([[colorscheme gruvbox]])
