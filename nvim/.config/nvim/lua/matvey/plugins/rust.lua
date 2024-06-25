return {
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            require('matvey.utils').setup_lsp(client, bufnr)

            vim.keymap.set('n', '<leader><CR>', function() vim.cmd.RustLsp('codeAction') end,
              { remap = false, buffer = bufnr, desc = 'Rust: code actions' })
            vim.keymap.set('n', '<leader>r', function() vim.cmd.RustLsp { 'runnables', bang = true } end,
              { remap = false, buffer = bufnr, desc = 'Rust: re-run' })
            vim.keymap.set('n', '<leader>R', function() vim.cmd.RustLsp('runnables') end,
              { remap = false, buffer = bufnr, desc = 'Rust: run' })
            vim.keymap.set('n', '<leader>d', function() vim.cmd.RustLsp { 'debuggables', bang = true } end,
              { remap = false, buffer = bufnr, desc = 'Rust: re-debug' })
            vim.keymap.set('n', '<leader>D', function() vim.cmd.RustLsp('debuggables') end,
              { remap = false, buffer = bufnr, desc = 'Rust: debug' })
            vim.keymap.set('n', '<leader>t', function() vim.cmd.RustLsp { 'testables', bang = true } end,
              { remap = false, buffer = bufnr, desc = 'Rust: re-test' })
            vim.keymap.set('n', '<leader>T', function() vim.cmd.RustLsp('testables') end,
              { remap = false, buffer = bufnr, desc = 'Rust: test' })
          end,
          default_settings = {
            ['rust-analyzer'] = {
              cargo = {
                features = { 'ssr' },
              },
              diagnostics = {
              }
            },
          }
        },
      }
    end
  }
}
