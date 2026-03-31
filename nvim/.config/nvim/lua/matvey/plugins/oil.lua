return {
  "stevearc/oil.nvim",
  dependencies = { "echasnovski/mini.icons" },
  lazy = false,
  keys = {
    { "<leader>1", "<cmd>Oil<CR>", desc = "File explorer" },
  },
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    columns = {
      "icon",
      -- "size",
      -- "mtime",
    },
    view_options = {
      show_hidden = true,
    },
  },
}
