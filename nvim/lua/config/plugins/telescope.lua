return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or                              , branch = '0.1.x',
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        pickers = {
          find_files = {
            theme = "ivy",
            hidden = true,
            no_ignore = true,
          },
          git_files = {
            theme = "ivy",
          },
          live_grep = {
            theme = "ivy",
          },
        },
        extensions = {
          fzf = {},
        },
      })

      telescope.load_extension("fzf")

      vim.keymap.set("n", "<leader>fh", builtin.help_tags)
      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      vim.keymap.set("n", "<leader>fp", builtin.git_files)
      vim.keymap.set("n", "<leader>lg", builtin.live_grep)
      vim.keymap.set("n", "<leader>ep", function()
        builtin.find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        })
      end)
    end,
  },
}
