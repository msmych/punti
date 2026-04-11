return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    -- Start treesitter
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- Textobjects
    require("nvim-treesitter-textobjects").setup({
      select = { lookahead = true },
    })

    -- Select
    local select = require("nvim-treesitter-textobjects.select")
    local maps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
    }
    for key, query in pairs(maps) do
      vim.keymap.set({ "x", "o" }, key, function()
        select.select_textobject(query, "textobjects")
      end)
    end

    -- Move
    local move = require("nvim-treesitter-textobjects.move")

    local moves = {
      { "]m", "goto_next_start", "@function.outer" },
      { "]M", "goto_next_end", "@function.outer" },
      { "[m", "goto_previous_start", "@function.outer" },
      { "[M", "goto_previous_end", "@function.outer" },
      { "]]", "goto_next_start", "@class.outer" },
      { "[[", "goto_previous_start", "@class.outer" },
    }
    for _, m in ipairs(moves) do
      vim.keymap.set({ "n", "x", "o" }, m[1], function()
        move[m[2]](m[3], "textobjects")
      end)
    end

    -- Repeatable moves
    local ts_repeat = require("nvim-treesitter-textobjects.repeatable_move")
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat.repeat_last_move_previous)
  end,
}

