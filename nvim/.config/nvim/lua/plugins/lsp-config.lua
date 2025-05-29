return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		local mason_lspconfig = require("mason-lspconfig")

		local function on_attach(client, bufnr)
			local map = function(lhs, rhs, desc, mode)
				mode = mode or "n"
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc })
			end

			-- table-driven maps
			local telescope = require("telescope.builtin")
			local mappings = {
				{ "gd", telescope.lsp_definitions, "[G]oto [D]efinition" },
				{ "gr", telescope.lsp_references, "[G]oto [R]eferences" },
				{ "gI", telescope.lsp_implementations, "[G]oto [I]mplementation" },
				{ "<leader>D", telescope.lsp_type_definitions, "Type [D]efinition" },
				{ "<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols" },
				{ "<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols" },
				{ "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame" },
				{ "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" } },
				{ "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration" },
			}

			for _, m in ipairs(mappings) do
				map(unpack(m))
			end

			-- optional inlay-hint toggle
			if client.supports_method("textDocument/inlayHint") then
				map("<leader>th", function()
					local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
					vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
				end, "Toggle Inlay Hints")
			end

			-- highlight references
			if client.supports_method("textDocument/documentHighlight") then
				local aug = vim.api.nvim_create_augroup("LspHighlight", { clear = false })
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					group = aug,
					buffer = bufnr,
					callback = vim.lsp.buf.document_highlight,
				})
				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "LspDetach" }, {
					group = aug,
					buffer = bufnr,
					callback = vim.lsp.buf.clear_references,
				})
			end
		end

		-- diagnostic look-and-feel
		vim.diagnostic.config({
			update_in_insert = true,
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			virtual_text = { spacing = 2, source = "if_many" },
		})

		-- capabilities for nvim-cmp
		local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities()
		)

		-- dynamically import custom server configs from config.lsp_servers directory
		local servers = mason_lspconfig.get_installed_servers()

		for _, name in ipairs(servers) do
			local ok, custom = pcall(require, "config.lsp-servers." .. name)
			local opts = vim.tbl_deep_extend("force", {
				capabilities = capabilities,
				on_attach = on_attach,
			}, ok and custom or {})

			vim.lsp.config(name, opts)
			vim.lsp.enable(name)
		end
	end,
}
