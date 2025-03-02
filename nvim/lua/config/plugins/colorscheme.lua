return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("tokyonight").setup({
        style = "night",
        transparent = true,

        on_highlights = function(hl, c)
          hl.Function = { fg = c.green }
          hl.Property = { fg = c.green }
          hl.String = { fg = c.orange }
          hl.Comment = { fg = c.green }
        end,
      })

      vim.cmd.colorscheme("tokyonight")
      vim.api.nvim_set_hl(0, "Normal", { bg = "#1a1a1a" })
    end,
  },
  {
    "catppuccin/nvim",
    enabled = false,
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        integrations = {
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
              ok = { "italic" },
            },
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
              ok = { "undercurl" },
            },
            inlay_hints = {
              background = true,
            },
          },
        },
      })

      vim.cmd.colorscheme("catppuccin")
      vim.api.nvim_set_hl(0, "Normal", { bg = "#1a1a1a" })
    end,
  },
}
