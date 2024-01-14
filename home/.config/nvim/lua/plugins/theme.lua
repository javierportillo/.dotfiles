return {
  {
    'RRethy/nvim-base16',
    config = function()
      -- vim.cmd [[colorscheme base16-vice]]

      vim.g.colors_name = 'base16-vice'

      require('base16-colorscheme').setup({
        base00 = '#17191E',
        base01 = '#22262D',
        base02 = '#3C3F4C',
        -- base03 = '#383A47',
        base03 = '#555E70', -- increase brightness of comments
        base04 = '#8B9CBE',
        -- base05 = '#8B9CBE',
        base05 = '#B2BFD9',
        base06 = '#B2BFD9',
        base07 = '#F4F4F7',
        base08 = '#FF29A8',
        base09 = '#85FFE0',
        base0A = '#F0FFAA',
        base0B = '#0BADFF',
        base0C = '#8265FF',
        base0D = '#00EAFF',
        base0E = '#00F6D9',
        base0F = '#FF3D81'
      })

      -- fix the vertical split lines
      vim.api.nvim_set_hl(0, "VertSplit", { fg = "#17191e", bg = "NONE" })

      -- fix color of matching paren
      vim.api.nvim_set_hl(0, "MatchParen", { fg = "white", bg = "black" })
    end
  }
}
