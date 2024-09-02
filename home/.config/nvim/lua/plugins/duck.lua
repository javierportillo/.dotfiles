return {
  {
    'tamton-aquib/duck.nvim',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<leader>0d', function()
        require('duck').hatch('🐈', 2)
      end, { desc = 'Hatch a Duck' })
      vim.keymap.set('n', '<leader>0k', function()
        require('duck').cook()
      end, { desc = 'Kill a Duck' })
      vim.keymap.set('n', '<leader>0a', function()
        require('duck').cook_all()
      end, { desc = 'Kill all Ducks' })
    end,
  },
}
