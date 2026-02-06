require("conform").setup({
  log_level = vim.log.levels.TRACE,
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "ruff" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
  },
})
