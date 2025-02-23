local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "<leader>fe", vim.cmd.Ex)
keymap("n", "<leader>new", vim.cmd.vnew)
keymap("n", "<leader>tab", "<C-w><S-t>")
keymap("n", "<leader>newt", "<leader>new <leader>tab")

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
