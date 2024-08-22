return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'folke/trouble.nvim',
      -- sets `vim.ui.select` to telescope
      -- ex: <F4> code actions open on telescope 🥳
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-tree/nvim-web-devicons',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]idn [F]iles' })
      vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]idn [S]elect Telescope' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
      vim.keymap.set('n', '<leader>fp', builtin.git_files, { desc = '[F]ind [P]royect files' })
      vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = '[F]ind [C]ommands' })
      vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = '[F]ind [M]an Pages' })
      vim.keymap.set('n', '<leader>fqf', builtin.quickfix, { desc = '[F]ind [Q]uick[F]ix' })

      vim.keymap.set('n', '<leader>fth', function()
        builtin.colorscheme({ enable_preview = true })
      end, { desc = '[F]ind [TH]emes' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = '[/] Fuzzy find this buffer' })

      local open_with_trouble = require('trouble.sources.telescope').open

      require('telescope').setup({
        defaults = {
          mappings = {
            i = { ['<c-t>'] = open_with_trouble },
            n = { ['<c-t>'] = open_with_trouble },
          },
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
          file_ignore_patterns = { 'node_modules' },
        },
        pickers = {
          find_files = {
            find_command = {
              'rg',
              '--files',
              '--smart-case',
              '--hidden',
              '--glob',
              '!**/.git/*',
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      })

      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ui-select')
    end,
  },
}
