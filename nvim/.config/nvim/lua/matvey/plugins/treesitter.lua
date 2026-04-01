return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  config = function()
    local ts = require("nvim-treesitter")

    local installed = ts.get_installed()
    local ensure = {
      "bash",
      "java",
      "json",
      "kotlin",
      "lua",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
      "yaml",
    }

    local missing = vim.tbl_filter(function(lang)
      return not vim.list_contains(installed, lang)
    end, ensure)

    if #missing > 0 then
      ts.install(missing)
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}

