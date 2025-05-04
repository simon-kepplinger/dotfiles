local telescope = require("telescope")
local builtin = require("telescope.builtin")

local file_ignore_patterns = { "node_modules", ".git" }

telescope.setup({
	pickers = {
		find_files = { hidden = true, file_ignore_patterns = file_ignore_patterns },
		git_files = { hidden = true, file_ignore_patterns = file_ignore_patterns },
		live_grep = {
			file_ignore_patterns = file_ignore_patterns,
			additional_args = function()
				return { "--hidden" }
			end,
		},
	},
})

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope find git files" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope find buffer" })
