return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup({
        -- A list of parser names, or 'all' (the five listed parsers should always be installed)
        ensure_installed = {
          'javascript',
          'typescript',
          'elixir',
          'c',
          'lua',
          'vim',
          'vimdoc',
          'query',
          'http',
          'json',
          'xml',
          'graphql',
          'regex',
          'bash',
          'markdown',
          'markdown_inline',
        },

        ignore_install = {},

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<leader>v', -- set to `false` to disable one of the mappings
            node_incremental = '<TAB>',
            scope_incremental = false,
            node_decremental = '<S-TAB>',
          },
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
  },
}
