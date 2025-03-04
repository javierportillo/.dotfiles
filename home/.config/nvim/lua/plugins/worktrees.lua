-- working with git worktrees
-- https://www.youtube.com/watch?v=2uEqYw-N8uE
return {
  'ThePrimeagen/git-worktree.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  event = 'VeryLazy',
  config = function()
    require('telescope').load_extension('git_worktree')

    vim.keymap.set('n', 'gwc', function()
      require('telescope').extensions.git_worktree.create_git_worktree()
    end, { desc = '[G]it [W]orktree [C]reate' })

    vim.keymap.set('n', 'gws', function()
      require('telescope').extensions.git_worktree.git_worktrees()
    end, { desc = '[G]it [W]orktree [S]witch' })
  end,
}
