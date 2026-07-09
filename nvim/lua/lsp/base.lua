local M = {}

function M.setup(opts)
  opts = opts or {}

  local ensure_installed = opts.ensure_installed or {}

  local capabilities = require("blink.cmp").get_lsp_capabilities()
  local lspconfig_configs = require("lspconfig.configs")

  for _, lsp in ipairs(ensure_installed) do
    -- Copy lspconfig's well-tested defaults into vim.lsp.config
    if lspconfig_configs[lsp] then
      vim.lsp.config[lsp] = vim.tbl_deep_extend("force",
        lspconfig_configs[lsp].default_config,
        { capabilities = capabilities }
      )
    end
  end

  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {})
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

  -- Diagnostics
  vim.diagnostic.config({ virtual_text = false })
  vim.keymap.set("n", "<leader>dn", ":lua vim.diagnostic.jump({count=1, float=true})<CR>")
  vim.keymap.set("n", "<leader>dp", ":lua vim.diagnostic.jump({count=-1, float=true})<CR>")
  vim.keymap.set("n", "<leader>do", ":lua vim.diagnostic.open_float()<CR>")
  vim.keymap.set("n", "<leader>dv", function()
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

      if client:supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
          end,
        })
      end
    end,
  })
end

return M
