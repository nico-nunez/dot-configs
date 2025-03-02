local ensure_installed = { "lua_ls", "ts_ls", "eslint", "gopls" }

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
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Setup ensure installed lsps
      for _, lsp in ipairs(ensure_installed) do
        lspconfig[lsp].setup({ capabilities = capabilities })
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      -- Diagnostics
      vim.keymap.set("n", "<leader>xn", ":lua vim.diagnostic.jump({count=1, float=true})<CR>")
      vim.keymap.set("n", "<leader>xp", ":lua vim.diagnostic.jump({count=-1, float=true})<CR>")
      vim.keymap.set("n", "<leader>xo", ":lua vim.diagnostic.open_float()<CR>")
      vim.keymap.set("n", "<leader>xv", function()
        local virtual_text = vim.diagnostic.config().virtual_text
        vim.diagnostic.config({ virtual_text = not virtual_text })
      end)

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end

          client.server_capabilities.semanticTokensProvider = nil
          
          ---@diagnostic disable-next-line: missing-parameter
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  },
}
