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
          hint = {
            type = 'statusline',
          },
        },
        heads = {
          { 'h', '5zh' },
          { 'l', '5zl', { desc = '←/→' } },
          { 'H', 'zH' },
          { 'L', 'zL', { desc = 'half screen ←/→' } },
        },
      })
    end,
  },
}
