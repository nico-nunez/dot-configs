return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",

    version = "*",
    build = "cargo build --release",

    opts = {
      keymap = {
        preset = "default",
        ["<C-space>"] = { "accept", "fallback" },
        ["<C-enter>"] = { "accept", "fallback" },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },
    },
  },
}
