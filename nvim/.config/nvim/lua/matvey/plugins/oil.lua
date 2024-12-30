return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = true,
    columns = {
      'icon',
      -- 'permissions',
      -- 'size',
      -- 'mtime',
    },
    prompt_save_on_select_new_entry = true,
    lsp_file_methods = {
      enabled = true,
      timeout_ms = 1000,
      autosave_changes = false,
    },
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
}
