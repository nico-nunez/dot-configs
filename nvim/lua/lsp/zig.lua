vim.lsp.config.zls = vim.tbl_deep_extend(
  "force",
  vim.lsp.config.zls or {},
  {
    settings = {
      zls = {
        enable_build_on_save = true,
        build_on_save_step = "check",
      },
    },
    init_options = {
      enable_build_on_save = true,
      build_on_save_step = "check",
    },
  }
)
