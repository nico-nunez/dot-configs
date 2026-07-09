return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "dockerfile",
        "editorconfig",
        "git_config",
        "gitignore",
        "go",
        "gomod",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "ssh_config",
        "swift",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "zig",
      }

      require("nvim-treesitter").install(ensure_installed)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match) or args.match
          if vim.treesitter.language.add(lang) then
            vim.treesitter.start()
          end
        end,
      })
    end,
  },
}
