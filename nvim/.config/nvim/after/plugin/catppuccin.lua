require("catppuccin").setup({
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
})

vim.cmd.colorscheme("catppuccin")
