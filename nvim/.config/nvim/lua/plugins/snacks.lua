-- replaces some UI elements with nicer looking versions

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		picker = { enabled = true },
		input = { enabled = true },
	},
}
