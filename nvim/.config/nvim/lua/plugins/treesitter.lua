return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	opts = {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"vim",
					"vimdoc",
					"help",
					"query",
					"bash",
					"lua",
					"html",
					"markdown",
					"javascript",
					"typescript",
					"c",
					"rust",
				},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				ignore_install = {},
				modules = {},
			})
		end,
	},
}
