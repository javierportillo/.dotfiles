return {
  {
    'tpope/vim-unimpaired',
    init = function()
      vim.g['nremap'] = {
        -- disable xml encode keymaps, need them for folke/trouble.nvim
        ['[x'] = '',
        ['[xx'] = '',
        [']x'] = '',
        [']xx'] = '',
      }
      vim.g['xremap'] = {
        ['[x'] = '',
        ['[xx'] = '',
        [']x'] = '',
        [']xx'] = '',
      }
    end
  }
}
