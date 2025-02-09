local keymap = vim.keymap.set

vim.g.mapleader = " "

-- Execute lua file
keymap("n", "<leader>x", ":.lua<CR>")
-- Execute line(s) in lua file
keymap("v", "<leader>x", ":lua<CR>")

keymap("n", "<leader>fe", vim.cmd.Ex)
keymap("n", "<leader>new", vim.cmd.vnew)
keymap("n", "<leader>tab", "<C-w><S-t>")
keymap("n", "<leader>newt", "<leader>new <leader>tab")
keymap("n", "<leader>x", ":.lua<CR>")
keymap("v", "<leader>x", ":lua<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

