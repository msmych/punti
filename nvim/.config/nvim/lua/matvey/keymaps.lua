-- Disable space (leader) in normal and visual
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")

-- Escape from insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Centered scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move selections up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste without overwriting register
vim.keymap.set("x", "<leader>p", '"_dP')

-- Indent and stay in visual
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Quickfix
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "]q", "<cmd>cprev<CR>zz")

-- File explorer
vim.keymap.set("n", "<leader>1", "<cmd>Ex<CR>")
