return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
      vim.keymap.set("n", "<leader>gl", "<cmd>G log --oneline --decorate --graph --all<cr>")
    end
  }
}
