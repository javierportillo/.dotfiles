-- Show pending keybinds
return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- run before UI elements are loaoded
    config = function()
      require('which-key').setup()

      require('which-key').add({
        { '<leader>f', group = '[F]ind', mode = { 'n' } },
        { '<leader>tr', group = '[T]est [R]unner', mode = { 'n' } },
        { '<leader>x', group = 'Trouble', mode = { 'n' } },
        { '<leader>D', group = 'DiffView', mode = { 'n' } },
      })
    end,
  },
}
