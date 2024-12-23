local lsp = require("lsp-zero")
lsp.preset("recommended")
-- require("lspconfig").denols.setup({})
lsp.format_on_save({
  format_opts = {
    timeout_ms = 10000,
  },
  servers = {
    ["ruby-lsp"] = { "ruby" },
    ["lua_ls"] = { "lua" },
  },
})

require("lspconfig").gleam.setup({})

require("lspconfig").ocamllsp.setup({})

lsp.setup({})

-------------------------------------------------------------------------------
-- on every lsp attach it does a check for deno app if so closes tsserver
-- this allows tsserver to start on single .ts files

lsp.on_attach(function(client)
  if
      vim.fs.dirname(
        vim.fs.find({ "deno.json", "import_map.json" }, { upward = true })[1]
      )
  then
    if client.name == "tsserver" then
      client.stop()
      return
    end
  end
end)

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

-- Just need to set the directory for denols to startup in
-- if it detects either files thats what it will do
lsp.configure("denols", {
  root_dir = vim.fs.dirname(
    vim.fs.find({ "deno.json", "import_map.json" }, { upward = true })[1]
  ),
})
-------------------------------------------------------------------------------

local cmp = require("cmp")
local luasnip = require("luasnip")

local function has_words_before()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
      and vim.api
      .nvim_buf_get_lines(0, line - 1, line, true)[1]
      :sub(col, col)
      :match("%s")
      == nil
end

cmp.setup({
  completion = {
    keyword_length = 1,
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
  preselect = true,
  mapping = {
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-n>"] = cmp.config.disable,
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<Esc>"] = cmp.mapping.abort(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          if cmp.get_selected_entry() then
            cmp.confirm()
          else
            cmp.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            })
          end
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    }),
  },
})
