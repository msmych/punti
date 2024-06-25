vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<leader>q', ':bd<CR>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Write' })

vim.keymap.set('n', ']b', ':bn<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '[b', ':bp<CR>', { desc = 'Go to previous buffer' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Go to left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Go to right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Go to down window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Go to up window' })

vim.keymap.set('x', '<leader>p', "\"_dP", { desc = 'Paste and keep clipboard value' })

vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })

vim.keymap.set('n', '<F2>', vim.diagnostic.goto_next, { desc = 'Go to next error' })
vim.keymap.set('n', '<F14>', vim.diagnostic.goto_prev, { desc = 'Go to previous error' })
vim.keymap.set('n', '<leader><F1>', vim.diagnostic.open_float, { desc = 'Show error message' })
vim.keymap.set('n', '<leader>6', vim.diagnostic.setloclist, { desc = 'Errors quicklist' })

vim.keymap.set('n', '<leader>gh', ':diffget //2<CR>', { desc = 'Git get left' })
vim.keymap.set('n', '<leader>gl', ':diffget //3<CR>', { desc = 'Git get right' })

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', '<C-f>', "<C-f>zz")
vim.keymap.set('n', '<C-b>', "<C-b>zz")

vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")

vim.keymap.set('n', '<leader>1', vim.cmd.Ex, { desc = 'Open file explorer' })
