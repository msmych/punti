-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.signcolumn = "yes"
vim.opt.cursorline = false
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.mouse = "a"
vim.opt.inccommand = "split"
vim.o.winborder = "rounded"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 1000

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- LSP
vim.lsp.enable("lua_ls")

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noinsert" }
