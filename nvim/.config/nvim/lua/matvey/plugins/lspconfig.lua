return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      { 'j-hui/fidget.nvim', opts = {} },

      'folke/neodev.nvim',
    },
    config = function()
      local mason = require('mason')
      mason.setup()

      require('neodev').setup()

      local servers = {
        lua_ls = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            telemetry = { enable = false },
            diagnostics = { disable = { 'missing-fields' } },
          }
        },
        eslint = {},
        tsserver = {},
      }

      local ensure_installed = vim.tbl_keys(servers)

      vim.list_extend(ensure_installed, {
        'stylua',
      })

      require('mason-tool-installer').setup {
        ensure_installed = ensure_installed,
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require('mason-lspconfig').setup {
        handlers = { function(server_name)
          local server = servers[server_name] or {}
          require('lspconfig')[server_name].setup {
            cmp = server.cmd,
            settings = servers[server_name],
            capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
            filetypes = server.filetypes,
            on_attach = function(client, bufnr)
              require('matvey.utils').setup_lsp(client, bufnr)
            end,
          }
        end
        }
      }
    end,
  }
}
