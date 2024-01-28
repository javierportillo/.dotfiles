return {
  {
    'RRethy/nvim-base16',
    config = function()
      -- vim.cmd [[colorscheme base16-vice]]
      -- vim.cmd [[colorscheme base16-black-metal-venom]]
      -- vim.cmd [[colorscheme base16-atlas]]
      -- vim.cmd [[colorscheme base16-grayscale-dark]]
      vim.cmd [[colorscheme base16-rose-pine-moon]]

      -- fix the vertical split lines
      vim.api.nvim_set_hl(0, "VertSplit", { fg = "grey", bg = "NONE" })
    end
  }
}
