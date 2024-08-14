return {
  {
    'RRethy/nvim-base16',
    config = function()
      -- vim.cmd [[colorscheme base16-vice]]
      -- vim.cmd [[colorscheme base16-black-metal-venom]]
      -- vim.cmd [[colorscheme base16-atlas]]
      -- vim.cmd [[colorscheme base16-grayscale-dark]]
      -- vim.cmd [[colorscheme base16-rose-pine-moon]]
      -- vim.cmd [[colorscheme base16-tokyo-night-terminal-dark]]
      -- vim.cmd [[colorscheme base16-outrun-dark]]
      -- vim.cmd [[colorscheme base16-gotham]]
      vim.cmd [[colorscheme base16-darkmoss]]

      -- fix the vertical split lines
      vim.api.nvim_set_hl(0, "VertSplit", { fg = "grey", bg = "NONE" })
    end
  }
}
