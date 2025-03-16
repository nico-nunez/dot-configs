return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gsp", "<cmd>Gitsigns preview_hunk<CR>")
      vim.keymap.set("n", "<leader>gsb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
      vim.keymap.set("n", "<leader>gsd", "<cmd>vertical Gdiffsplit<CR>")
    end,
  },
}
