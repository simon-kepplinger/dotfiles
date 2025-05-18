vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- move selected content
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without loosing
vim.keymap.set("x", "<leader>p", '"_dP')

-- use system clipboard
vim.keymap.set("n", "y", '"+y')
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("n", "Y", '"+Y')

-- basic diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, { desc = "Open [D]iagnostics [I]nfo" })
