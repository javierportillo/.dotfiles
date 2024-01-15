return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      },
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
      vim.keymap.set('n', '<leader>fc', builtin.commands, {})
      vim.keymap.set('n', '<leader>fm', builtin.man_pages, {})
      vim.keymap.set('n', '<leader>fth', function() builtin.colorscheme({ enable_preview = true }) end, {})
      vim.keymap.set('n', '<leader>fqf', builtin.quickfix, {})

      -- LSP keybindings
      vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
      vim.keymap.set('n', '<leader>go', builtin.lsp_type_definitions, {})
      vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {})
      vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
      vim.keymap.set('n', '<leader>gp', builtin.diagnostics, {})

      require('telescope').setup {
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--hidden',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
          },
          file_ignore_patterns = { "node_modules", ".git" },
        },
        pickers = {
          find_files = {
            find_command = {
              "rg",
              "--files",
              "--smart-case",
              "--hidden",
              "--glob",
              "!**/.git/*"
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        }
      }
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension('fzf')
    end
  },
}
