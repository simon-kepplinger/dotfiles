return {
	"williamboman/mason.nvim",

	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local mason_dap = require("mason-nvim-dap")

		mason.setup({ ui = { border = "rounded" } })

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"pyright",
				"bashls",
				"lua_ls",
				"rust_analyzer",
			},
			automatic_enable = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- js formatter
				"stylua", -- lua formatter
				"shfmt", -- bash formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
			},
		})

		mason_dap.setup({
			ensure_installed = {
				"codelldb",
			},
			handlers = {},
		})
	end,
}
