return {
  {
    'machakann/vim-columnmove',
    event = 'VimEnter',
    init = function()
      vim.g.columnmove_no_default_key_mappings = true
    end,
    config = function()
      -- |columnmove-f|  <Plug>(columnmove-f)  <M-f>
      -- |columnmove-t|  <Plug>(columnmove-t)  <M-t>
      -- |columnmove-F|  <Plug>(columnmove-F)  <M-F>
      -- |columnmove-T|  <Plug>(columnmove-T)  <M-T>
      -- |columnmove-;|  <Plug>(columnmove-;)  <M-;>
      -- |columnmove-,|  <Plug>(columnmove-,)  <M-,>
      -- |columnmove-w|  <Plug>(columnmove-w)  <M-w>
      -- |columnmove-b|  <Plug>(columnmove-b)  <M-b>
      -- |columnmove-e|  <Plug>(columnmove-e)  <M-e>
      -- |columnmove-ge| <Plug>(columnmove-ge) g<M-e> and <M-g><M-e>
      -- |columnmove-W|  <Plug>(columnmove-W)  <M-W>
      -- |columnmove-B|  <Plug>(columnmove-B)  <M-B>
      -- |columnmove-E|  <Plug>(columnmove-E)  <M-E>
      -- |columnmove-gE| <Plug>(columnmove-gE) g<M-E> and <M-g><M-E>

      vim.keymap.set({ 'x', 'n' }, '<m-B>', '<Plug>(columnmove-B)', { desc = 'Move to [B]eginnign of column' })
      vim.keymap.set({ 'x', 'n' }, '<m-E>', '<Plug>(columnmove-E)', { desc = 'Move to [E]nd of column' })
    end,
  },
}
