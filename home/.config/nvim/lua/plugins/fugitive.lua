return {
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gs', vim.cmd.Git },
      { '<leader>gl', '<cmd>G log --oneline --decorate --graph --all<cr>' },
    },
  },
}
