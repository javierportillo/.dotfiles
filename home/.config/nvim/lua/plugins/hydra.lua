return {
  {
    'anuvyklack/hydra.nvim',
    event = 'VimEnter',
    config = function()
      local Hydra = require('hydra')

      Hydra({
        name = 'Side scroll',
        mode = 'n',
        body = 'z',
        config = {
          -- hint = { type = 'window' },
          hint = false,
        },
        heads = {
          { 'h', '5zh' },
          { 'l', '5zl', { desc = '←/→' } },
          { 'H', 'zH' },
          { 'L', 'zL', { desc = 'half screen ←/→' } },
        },
      })

      Hydra({
        name = 'Split resize',
        mode = 'n',
        body = '<c-w>',
        config = {
          hint = false,
        },
        heads = {
          { '+', '<c-w>5+' },
          { '-', '<c-w>5-', { desc = '+/- height' } },
          { '<', '<c-w>5<' },
          { '>', '<c-w>5>', { desc = '</> width' } },
        },
      })
    end,
  },
}
