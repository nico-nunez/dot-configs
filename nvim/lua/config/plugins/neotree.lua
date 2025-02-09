return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
     vim.keymap.set("n", "<leader>/", ":Neotree toggle reveal right<CR>")
      --nnoremap | :Neotree reveal<cr>
      --nnoremap gd :Neotree float reveal_file=<cfile> reveal_force_cwd<cr>
      --nnoremap <leader>b :Neotree toggle show buffers right<cr>
      --nnoremap <leader>s :Neotree float git_status<cr>
    end
  }
}
