-- vim.cmd [[colorscheme base16-vice]]

vim.g.colors_name = 'base16-vice'

require('base16-colorscheme').setup({
  base00 = '#17191e',
  base01 = '#22262d',
  base02 = '#3c3f4c',
  -- base03 = '#383a47', -- increase brightness of comments
  base03 = '#8b9cbe',
  base04 = '#8b9cbe',
  base05 = '#8b9cbe',
  base06 = '#b2bfd9',
  base07 = '#f4f4f7',
  base08 = '#ff29a8',
  base09 = '#85ffe0',
  base0A = '#f0ffaa',
  base0B = '#0badff',
  base0C = '#8265ff',
  base0D = '#00eaff',
  base0E = '#00f6d9',
  base0F = '#ff3d81'
})

vim.api.nvim_set_hl(0, "VertSplit", { fg = "#17191e", bg = "NONE" })
