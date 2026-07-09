vim.lsp.config.sourcekit = vim.tbl_deep_extend(
  "force",
  vim.lsp.config.sourcekit or {},
  {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    cmd = { "xcrun", "sourcekit-lsp" },
    filetypes = { "swift" },
    root_markers = { "buildServer.json", "Package.swift", ".git" },
  }
)

vim.lsp.enable("sourcekit")
