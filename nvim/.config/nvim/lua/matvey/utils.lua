local M = {}

M.find_git_root = function()
  local current_file = vim.api.nvim_buf_get_name(0)

  local current_dir
  local cwd = vim.fn.getcwd()
  if current_file == '' then
    current_dir = cwd
  else
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]

  if vim.v.shell_error ~= 0 then
    return nil
  end
  return git_root
end

M.setup_lsp = function(client, bufnr)
  vim.keymap.set('n', '<leader><CR>', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'LSP: code action' })
  vim.keymap.set('n', '<leader><F6>', vim.lsp.buf.rename, { buffer = bufnr, desc = 'LSP: rename' })
  vim.keymap.set('i', '<C-p>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'LSP: signature help' })
  vim.keymap.set('n', '<leader>ih', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, { buffer = bufnr, desc = 'LSP: toggle inlay hints' })

  local telescope = require 'telescope.builtin'

  vim.keymap.set('n', 'gd', telescope.lsp_definitions, { buffer = bufnr, desc = 'LSP: go to definition' })
  vim.keymap.set('n', 'gD', telescope.lsp_type_definitions, { buffer = bufnr, desc = 'LSP: go to type' })
  vim.keymap.set('n', 'gr', function()
    telescope.lsp_references { show_line = false }
  end, { buffer = bufnr, desc = 'LSP: search references' })
  vim.keymap.set('n', 'gR', telescope.lsp_implementations, { buffer = bufnr, desc = 'LSP: search implementations' })
  vim.keymap.set('n', '<leader>7', telescope.lsp_document_symbols, { buffer = bufnr, desc = 'LSP: document symbols' })
  vim.keymap.set('n', '<leader>&', telescope.lsp_dynamic_workspace_symbols, { buffer = bufnr, desc = 'LSP: search symbols' })

  if client and client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

M.multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()
  local pickers = require 'telescope.pickers'
  local finder = require('telescope.finders').new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == '' then
        return nil
      end
      local parts = vim.split(prompt, '  ')
      local args = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' }
      if parts[1] then
        table.insert(args, '-e')
        table.insert(args, parts[1])
      end
      if parts[2] then
        table.insert(args, '-g')
        table.insert(args, parts[2])
      end
      return args
    end,
    entry_maker = require('telescope.make_entry').gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }
  pickers
    .new(opts, {
      debounce = 100,
      finder = finder,
      previewer = require('telescope.config').values.grep_previewer(opts),
      sorter = require('telescope.sorters').empty(),
      prompt_title = 'Multigrep',
    })
    :find()
end

return M
