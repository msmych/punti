return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    "default-title",
    winopts = {
      height = 0.85,
      width = 0.80,
      preview = { layout = "vertical" },
    },
  },
  keys = {
    { "<leader>a", "<cmd>FzfLua builtin<CR>", desc = "Find actions" },
    {
      "<leader>o",
      function()
        local fzf = require("fzf-lua")
        if vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):find("true") then
          fzf.git_files()
        else
          fzf.files()
        end
      end,
      desc = "Find files",
    },
    { "<leader>O", "<cmd>FzfLua files<CR>", desc = "Find all files" },
    { "<leader>e", "<cmd>FzfLua oldfiles<CR>", desc = "Recent files" },
    { "<leader>f", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
    { "<leader><Tab>", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
    { "<leader><F1>", "<cmd>FzfLua help_tags<CR>", desc = "Help tags" },
    { "<leader>/", "<cmd>FzfLua grep_curbuf<CR>", desc ="Search current buffer" },
    { "<leader>;", "<cmd>FzfLua resume<CR>", desc = "Resume last search" },
    { "<leader>2", "<cmd>FzfLua marks<CR>", desc = "Marks" },
    { "<leader>9", "<cmd>FzfLua git_commits<CR>", desc = "Git history" },
  },
}
