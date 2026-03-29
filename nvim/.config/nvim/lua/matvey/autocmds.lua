-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("matvey-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = false,
  float = {
    border = "rounded",
    source = "if_many"
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)
