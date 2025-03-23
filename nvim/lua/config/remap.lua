local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "<leader>fe", vim.cmd.Ex)
keymap("n", "<leader>new", vim.cmd.vnew)
keymap("n", "<leader>tab", "<C-w><S-t>")
keymap("n", "<leader>newt", "<leader>new <leader>tab")

-- Move lines up/down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered
--  half-page scrolling
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
--  searching
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Clear search highlighting
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Toggle 'smartcase' sensitivity
keymap("n", "<leader>scs", function()
  local ignorecase = vim.opt.ignorecase:get()
  local smartcase = vim.opt.smartcase:get()

  vim.opt.ignorecase = not ignorecase
  vim.opt.smartcase = not smartcase
end)

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

keymap("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
keymap("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })
