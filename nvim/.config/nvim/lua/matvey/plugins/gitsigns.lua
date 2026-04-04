return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = require("gitsigns")

      -- Navigation
      vim.keymap.set("n", "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { buffer = bufnr, expr = true })
      vim.keymap.set("n", "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { buffer = bufnr, expr = true })

      -- Hunks
      vim.keymap.set("n", "<leader>ha", gs.stage_hunk, { buffer = bufnr })
      vim.keymap.set("v", "<leader>ha", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { buffer = bufnr })
      vim.keymap.set("n", "<leader>hz", gs.reset_hunk, { buffer = bufnr })
      vim.keymap.set("v", "<leader>hz", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { buffer = bufnr })
      vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr })
      vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr })
    end,
  }
}
