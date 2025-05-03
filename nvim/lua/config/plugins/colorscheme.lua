return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
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
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      local c = require("config.darkplus.colors")
      local darkplus = require("config.darkplus.theme")

      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        color_overrides = {
          -- mocha = { base = c.bg, crust = c.fg },
        },
        custom_highlights = function()
          return darkplus.base
        end,
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
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1a1a1a" })
      vim.api.nvim_set_hl(0, "CurSearch", { undercurl = true })
      vim.api.nvim_set_hl(0, "Search", { bg = "#1a1a1a", undercurl = true })

      vim.api.nvim_set_hl(0, "@tag", { fg = c.cyan })
      vim.api.nvim_set_hl(0, "@variable", { fg = c.light_blue })
      vim.api.nvim_set_hl(0, "@keyword.export", { fg = c.purple })
      vim.api.nvim_set_hl(0, "@keyword.report", { fg = c.purple })
      vim.api.nvim_set_hl(0, "@type.builtin", { fg = c.lighter_green })
      vim.api.nvim_set_hl(0, "@constant.builtin", { fg = c.purple })
      vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = c.yellow })
      vim.api.nvim_set_hl(0, "@variable.member", { fg = c.light_blue })
      vim.api.nvim_set_hl(0, "@variable.parameter", { fg = c.light_blue })
      vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = c.light_blue, italic = true })

      -- Semantic (nil == off; set in lsp.lua)
      vim.api.nvim_set_hl(0, "@lsp", { fg = c.hint_blue })
      vim.api.nvim_set_hl(0, "@lsp.type.interface", { fg = c.cyan })
      vim.api.nvim_set_hl(0, "@lsp.typemod.interface.declaration.typescriptreact", { fg = c.cyan })
    end,
  },
}
