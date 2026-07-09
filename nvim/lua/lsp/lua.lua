vim.lsp.config.lua_ls = vim.tbl_deep_extend(
  "force",
  vim.lsp.config.lua_ls or {},
  {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = { vim.env.VIMRUNTIME },
          checkThirdParty = false,
        },
      },
    },
  }
)
