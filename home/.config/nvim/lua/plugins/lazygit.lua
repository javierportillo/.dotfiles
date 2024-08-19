return {
  {
    -- best Git client ever
    'kdheepak/lazygit.nvim',
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', vim.cmd.LazyGit, desc = 'Open LazyGit' },
    }
  },
}
