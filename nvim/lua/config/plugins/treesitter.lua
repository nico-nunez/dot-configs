return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
      config.setup({
				-- A list of parser names, or "all" (the listed parsers MUST always be installed)
				ensure_installed = {
					"c",
					"lua",
					"javascript",
					"typescript",
					"go",
					"vim",
					"vimdoc",
					"query",
					"markdown",
					"markdown_inline",
				},

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

				auto_install = true,
				ignore_install = { "c", "rust" },
				highlight = {
					enable = true,
				},
			})
		end,
	},
}
