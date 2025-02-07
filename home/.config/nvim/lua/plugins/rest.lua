return {
  {
    'rest-nvim/rest.nvim',
    enabled = true,
    dependencies = { 'luarocks.nvim' },
    ft = 'http',
    keys = {
      { '<leader>R', '<cmd>Rest run<cr>', desc = 'Run Rest Request' },
    },
  },
}
