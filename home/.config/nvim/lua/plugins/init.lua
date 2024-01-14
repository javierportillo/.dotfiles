return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
      },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'onsails/lspkind.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  'christoomey/vim-tmux-navigator',
  'mbbill/undotree',
  'tpope/vim-obsession',
  'tpope/vim-surround',
  'christoomey/vim-tmux-navigator',
  'cohama/lexima.vim',
  'b0o/schemastore.nvim',

  'xiyaowong/transparent.nvim',
}
