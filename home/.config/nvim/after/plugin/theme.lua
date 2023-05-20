require("tokyonight").setup({
  style = "storm",
  transparent = true,
  on_colors = function(colors)
    -- vim.g.tokyonight_colors = { fg_gutter = "#707cb2", comment = "#709db2", dark5 = "#709db2" }
    colors.fg_gutter = "#707cb2"
  end
})

vim.cmd [[colorscheme tokyonight]]
