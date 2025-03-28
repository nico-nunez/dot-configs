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
            file_ignore_patterns = { ".git" },
          },
          git_files = {
            theme = "ivy",
            show_untracked = true,
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

      -- Search nvim configs
      vim.keymap.set("n", "<leader>en", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end)

      -- Search installed plugins
      vim.keymap.set("n", "<leader>ep", function()
        builtin.find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        })
      end)
    end,
  },
}
