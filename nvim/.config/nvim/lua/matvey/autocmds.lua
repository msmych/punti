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
    source = "if_many"
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("matvey-lsp-attach", { clear = true }),
  callback = function(event)
    local buf = event.buf
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "LSP definition" })
    vim.keymap.set("n", "gr", function()
      require("fzf-lua").lsp_references()
    end, { buffer = buf, desc = "LSP references" })
    vim.keymap.set("n", "<leader><CR>", vim.lsp.buf.code_action, { buffer = buf, desc = "LSP code action" })
    vim.keymap.set("n", "<leader><F1>", vim.diagnostic.open_float, { buffer = buf, desc = "LSP diagnostic" })
    vim.keymap.set("n", "<F18>", vim.lsp.buf.rename, { buffer = buf, desc = "LSP rename" })
    vim.keymap.set("i", "<C-p>", vim.lsp.buf.signature_help, { buffer = buf, desc = "LSP signature help" })

    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
    end

    -- Highlight
    if client and client:supports_method("textDocument/documentHighlight") then
      local hl_group = vim.api.nvim_create_augroup("matvey-lsp-highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = buf,
        group = hl_group,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = buf,
        group = hl_group,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

-- Cleanup highlight on LSP detach
vim.api.nvim_create_autocmd("LspDetach", {
  group = vim.api.nvim_create_augroup("matvey-lsp-detach", { clear = true }),
  callback = function(event)
    vim.lsp.buf.clear_references()
    vim.api.nvim_clear_autocmds({ group = "matvey-lsp-highlight", buffer = event.buf })
  end,
})
