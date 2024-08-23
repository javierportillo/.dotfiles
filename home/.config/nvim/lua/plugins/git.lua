return {
  {
    'tpope/vim-fugitive',
    event = 'vimEnter',
    keys = {
      { '<leader>gs', vim.cmd.Git, desc = 'Open Git Status' },
      { '<leader>gl', '<cmd>G log --oneline --decorate --graph --all<cr>', desc = 'Open Git Log' },
    },
  },
  {
    -- best Git client ever
    'kdheepak/lazygit.nvim',
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', vim.cmd.LazyGit, desc = 'Open LazyGit' },
    },
  },
}
