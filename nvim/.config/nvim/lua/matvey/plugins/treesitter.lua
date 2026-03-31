return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local install = require("nvim-treesitter.install")
    local installed = require("nvim-treesitter").get_installed()
    local ensure = { "lua", "vim", "vimdoc", "query" }
    for _, lang in ipairs(ensure) do
      if not vim.tbl_contains(installed, lang) then
        install.install(lang)
      end
    end
  end,
}

