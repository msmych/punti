return {
  {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>l',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = 'Format',
      }
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disabled = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disabled[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { { 'prettier' } },
        javascriptreact = { { 'prettier' } },
        typescript = { { 'prettier' } },
        typescriptreact = { { 'prettier' } },
        json = { { 'jq' } },
      }
    },
  }
}
