return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = false,
    config = function()
      require('rose-pine').setup({
        dark_variant = 'moon',
        highlight_groups = {
          TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
          TelescopeNormal = { bg = 'none' },
          TelescopePromptNormal = { bg = 'base' },
          TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
          TelescopeSelection = { fg = 'text', bg = 'base' },
          TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
        },
      })

      vim.cmd([[colorscheme rose-pine]])
      vim.fn.matchadd('Colorcolumn', [[\%81v]], 100)
    end,
  },
  {
    'RRethy/nvim-base16',
    enabled = false,
    config = function()
      -- vim.cmd [[colorscheme base16-vice]]
      -- vim.cmd [[colorscheme base16-black-metal-venom]]
      -- vim.cmd [[colorscheme base16-atlas]]
      -- vim.cmd [[colorscheme base16-grayscale-dark]]
      vim.cmd([[colorscheme base16-rose-pine-moon]])
      -- vim.cmd [[colorscheme base16-tokyo-night-terminal-dark]]
      -- vim.cmd [[colorscheme base16-outrun-dark]]
      -- vim.cmd [[colorscheme base16-gotham]]
      -- vim.cmd [[colorscheme base16-darkviolet]]
      -- vim.cmd [[colorscheme base16-darkmoss]]
      -- vim.cmd [[colorscheme base16-silk-dark]]

      -- fix the vertical split lines
      vim.api.nvim_set_hl(0, 'VertSplit', { fg = 'grey', bg = 'NONE' })
    end,
  },
  {
    'mawkler/modicator.nvim',
    dependencies = 'folke/tokyonight.nvim', -- WARN: Add your colorscheme plugin here
    event = 'VeryLazy',
    init = function()
      -- These are required for Modicator to work
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    opts = {
      -- Warn if any required option above is missing. May emit false positives
      -- if some other plugin modifies them, which in that case you can just
      -- ignore. Feel free to remove this line after you've gotten Modicator to
      -- work properly.
      show_warnings = true,
      integration = {
        lualine = {
          mode_section = 'a',
        },
      },
    },
  },
}
