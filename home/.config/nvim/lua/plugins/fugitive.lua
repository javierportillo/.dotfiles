return {
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gs', vim.cmd.Git, desc = 'Open Git Status' },
      { '<leader>gl', '<cmd>G log --oneline --decorate --graph --all<cr>', desc = 'Open Git Log' },
    },
  },
}
