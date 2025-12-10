vim.lsp.enable("gleam")
vim.lsp.enable("uiua")
vim.lsp.enable("helm_ls")
vim.lsp.enable("nickel_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("ts_ls")
vim.lsp.enable("ocamllsp")
vim.lsp.enable("ruff")

-- Custom config for pyright
vim.lsp.config.pyright = {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
}

-- Custom config for ruff
vim.lsp.config.ruff = {
  cmd = {
    "ruff",
    "server",
    "--config",
    vim.fn.getcwd() .. "/pyproject.toml",
  },
}
