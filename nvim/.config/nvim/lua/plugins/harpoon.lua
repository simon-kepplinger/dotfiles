return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end)

		-- Meta-1 through Meta-4
		for i = 1, 4 do
			vim.keymap.set("n", "<M-" .. i .. ">", function()
				harpoon:list():select(i)
			end)
		end
	end,
}
