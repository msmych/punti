return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>0', vim.cmd.G, { desc = 'Open Git' })
    end,
  },
}
