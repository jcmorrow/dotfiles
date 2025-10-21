-- local lsp = require("lsp-zero")
-- lsp.preset("recommended")
-- -- require("lspconfig").denols.setup({})
-- lsp.format_on_save({
--   format_opts = {
--     timeout_ms = 10000,
--   },
--   servers = {
--     ["ruby-lsp"] = { "ruby" },
--     ["lua_ls"] = { "lua" },
--     ["ruff"] = { "python" },
--   },
-- })
vim.lsp.enable("gleam")
vim.lsp.enable("uiua")
vim.lsp.enable("helm_ls")
vim.lsp.enable("nickel_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("ts_ls")

require("lspconfig").ts_ls.setup({})
require("lspconfig").gleam.setup({})
require("lspconfig").uiua.setup({})
require("lspconfig").ocamllsp.setup({})
require("lspconfig").helm_ls.setup({})
require("lspconfig").nickel_ls.setup({})
require("lspconfig").pyright.setup({
  before_init = function(_, config)
    -- Run the 'which python' command and capture its output
    local output = vim.fn.system("which python")

    -- Remove trailing newline
    local python_path = output:gsub("\n", "")

    -- Only set the path if the command succeeded
    if vim.v.shell_error == 0 and python_path ~= "" then
      config.settings = config.settings or {}
      config.settings.python = config.settings.python or {}
      config.settings.python.pythonPath = python_path

      -- Optional: Add debug print to verify it's working
      vim.notify("Pyright using Python: " .. python_path, vim.log.levels.INFO)
    end
  end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})
-- Ruff LSP for linting and formatting
require("lspconfig").ruff.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  cmd = {
    "ruff",
    "server",
    "--config",
    vim.fn.getcwd() .. "/pyproject.toml",
  },
})
