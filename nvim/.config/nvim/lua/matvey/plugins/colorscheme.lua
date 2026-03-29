return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      styles = {
        bold = true,
        italic = false,
        transparency = true,
      },
      dim_inactive_windows = true,
      highlight_groups = {
        -- Comment = { fg = "#a9a6c0" }, -- brighter comments
      },
    })
    vim.cmd.colorscheme("rose-pine")
  end,
}
