vim.lsp.enable("gleam")
vim.lsp.enable("uiua")
vim.lsp.enable("helm_ls")
vim.lsp.enable("nickel_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("ts_ls")
vim.lsp.enable("ocamllsp")
vim.lsp.enable("ruff")
vim.lsp.enable("zls")
vim.lsp.enable("rust_analyzer")

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

-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client and client:supports_method("textDocument/formatting") then
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         buffer = args.buf,
--         callback = function()
--           vim.lsp.buf.format({ async = false })
--         end,
--       })
--     end
--   end,
-- })
