return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},

	config = function()
		local dap = require("dap")
		local dap_ui = require("dapui")
		local dap_virtual_text = require("nvim-dap-virtual-text")

		-- Rust DAP
		dap.configurations.rust = {
			{
				name = "Debug",
				type = "codelldb",
				request = "launch",

				program = function()
					vim.fn.jobstart("cargo build", { detach = false })
					return vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				end,
				cwd = "${workspaceFolder}",
			},
		}

		dap.configurations.rust = {
			{
				name = "Debug specific bin",
				type = "codelldb",
				request = "launch",

				program = function()
					local bin = vim.fn.input("cargo --bin » ", "my_binary", "file") -- prompt once
					vim.fn.jobstart("cargo build --bin " .. bin, { detach = false }) -- ① compile
					return vim.fn.getcwd() .. "/target/debug/" .. bin -- ② path
				end,
				cwd = "${workspaceFolder}",
			},
		}

		dap_ui.setup()
		dap_virtual_text.setup({})

		-- auto-open / close the sidebar when sessions start & stop
		dap.listeners.before.attach.dapui = function()
			dap_ui.open()
		end
		dap.listeners.before.launch.dapui = function()
			dap_ui.open()
		end
		dap.listeners.before.event_terminated.dapui = function()
			dap_ui.close()
		end
		dap.listeners.before.event_exited.dapui = function()
			dap_ui.close()
		end

		local map = vim.keymap.set
		map("n", "<Leader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
		map("n", "<leader>dc", dap.continue, { desc = "DAP continue / start" })
		map("n", "<leader>dn", dap.step_over, { desc = "DAP next step / step over" })
		map("n", "<leader>di", dap.step_into, { desc = "DAP step into" })
		map("n", "<leader>do", dap.step_out, { desc = "DAP step out" })
		map("n", "<Leader>dR", require("dap").repl.open, { desc = "DAP open REPL" })
	end,
}
