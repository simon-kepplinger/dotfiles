return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	opts = {
		flavour = "mocha",
		transparent_background = true,
		color_overrides = {
			mocha = {
				base = "#000000",
				mantle = "#000000",
				crust = "#000000",
			},
		},
		custom_highlights = function(colors)
			return {
				WinSeparator = { fg = colors.blue },
			}
		end,
		default_integrations = true,
		integrations = {
			cmp = true,
			harpoon = true,
			mason = true,
		},
	},

	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
