return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    ft = { "markdown" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreview<cr>')
      vim.keymap.set('n', '<leader>ms', '<cmd>MarkdownPreviewStop<cr>')

      -- Change default syntax highlighting
      vim.g.mkdp_highlight_css = vim.fn.expand('~/.config/a11y-dark.css')
      vim.g.mkdp_auto_close = 0
    end,
  }
}
