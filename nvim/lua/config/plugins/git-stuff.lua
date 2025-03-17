return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
      vim.keymap.set("n", "<leader>gs", "<cmd>vertical Gdiffsplit<CR>")
    end,
  },
}
