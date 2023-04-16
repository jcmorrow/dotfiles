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
        typescript = {
            require("formatter.filetypes.typescript").prettierd,
        },
        rust = {
            require("formatter.filetypes.rust").rustfmt,
        },
        vue = {
            require("formatter.filetypes.typescript").eslint_d,
        },
    }
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        vim.cmd.FormatWrite()
    end,
})
