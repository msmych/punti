return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',

        build = 'make',

        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-telescope/telescope-dap.nvim' },
    },
    config = function()
      local telescope = require 'telescope'
      local themes = require 'telescope.themes'
      telescope.setup {
        extensions = {
          ['ui-select'] = {
            themes.get_dropdown(),
          },
        },
      }
      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension, 'ui-select')
      pcall(telescope.load_extension, 'dap')

      local builtin = require 'telescope.builtin'

      vim.keymap.set('n', '<F13>', builtin.help_tags, { desc = 'Search help' })
      vim.keymap.set('n', '<leader><Tab>', builtin.buffers, { desc = 'Search buffers' })
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown())
      end, { desc = 'Search in current buffer' })
      vim.keymap.set('n', '<leader>?', function()
        builtin.live_grep { grep_open_files = true, prompt_title = 'Search in open files' }
      end, { desc = 'Search in open files' })
      vim.keymap.set('n', '<leader>2', builtin.marks, { desc = 'Search marks' })
      vim.keymap.set('n', '<leader>^', builtin.diagnostics, { desc = 'Search errors' })
      vim.keymap.set('n', '<leader>9', builtin.git_commits, { desc = 'Search Git commits' })

      local utils = require 'matvey.utils'

      vim.keymap.set('n', '<leader>o', function()
        if utils.find_git_root() ~= nil then
          builtin.git_files()
        else
          builtin.find_files {
            hidden = true,
            file_ignore_patterns = { 'node_modules/' },
          }
        end
      end, { desc = 'Search Git files' })
      vim.keymap.set('n', '<leader>O', function()
        builtin.find_files {
          hidden = true,
          file_ignore_patterns = { '.git/', 'node_modules/' },
        }
      end, { desc = 'Search files in Git root' })
      vim.keymap.set('n', '<leader>e', builtin.oldfiles, { desc = 'Search old files' })
      vim.keymap.set('n', '<leader>f', function()
        builtin.grep_string {
          search = vim.fn.input 'Search: ',
          prompt_title = 'Search by grep',
        }
      end, { desc = 'Search by grep' })
      vim.keymap.set('n', '<leader>F', function()
        require('matvey.utils').multigrep()
      end, { desc = 'Multigrep' })
      vim.keymap.set('n', '<leader><space>', function()
        builtin.find_files {
          cwd = utils.find_git_root(),
          hidden = true,
        }
      end, { desc = 'Search all files' })
      vim.keymap.set('n', '<leader>*', builtin.grep_string, { desc = 'Search word under cursor' })
      vim.keymap.set('n', '<leader>;', builtin.resume, { desc = 'Resume search' })

      local dap = telescope.extensions.dap
      vim.keymap.set('n', '<leader>@', dap.list_breakpoints, { desc = 'Search breakpoints' })
    end,
  },
}
