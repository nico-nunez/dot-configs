local ensure_installed = {
  "lua_ls",
  "ts_ls",
  "eslint",
  "gopls",
  "tailwindcss",
  "pyright",
  "html",
  "clangd",
  "jsonls",
  "zls",
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      require("lsp.base").setup({ ensure_installed = ensure_installed })
      require("lsp.lua")
      require("lsp.zig")
      require("lsp.swift")
    end,
  },
}
