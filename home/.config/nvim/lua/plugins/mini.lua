return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('mini.align').setup()
    end,
  },
}
