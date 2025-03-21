local vim = vim
local formatter = require("formatter")

formatter.setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    ruby = {
      require("formatter.filetypes.ruby").rubocop,
    },
    javascript = {
      require("formatter.filetypes.typescript").prettierd,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettierd,
    },
    typescriptreact = {
      require("formatter.filetypes.typescript").prettierd,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
    go = {
      require("formatter.filetypes.go").gofmt,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    vim.cmd.FormatWrite()
  end,
})
