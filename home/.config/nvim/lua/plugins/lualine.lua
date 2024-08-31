return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    dependencies = {
      'stevearc/conform.nvim',
      'nvim-tree/nvim-web-devicons',
      'meuter/lualine-so-fancy.nvim',
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {
          -- left = '',
          -- right = '',
          left = '',
          right = '',
        },
        section_separators = {
          -- left = '',
          -- right = '',
          left = '',
          right = '',
        },
        disabled_filetypes = {
          statusline = { 'neo-tree' },
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { { 'fancy_mode', width = 3 } },
        lualine_b = { 'fancy_branch', 'fancy_diff', 'fancy_diagnostics' },
        lualine_c = { 'fancy_cwd', { 'filename', path = 4 } },
        lualine_x = {
          'fancy_searchcount',
          'fancy_macro',
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = {
          'fancy_lsp_servers',
        },
        lualine_z = { 'progress', 'location' },
      },
      -- what to show on inactive splits
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
    config = function(_, opts)
      local current_formatter = function()
        local formatters = require('conform').list_formatters_to_run()
        if #formatters == 0 then
          return ''
        end

        local x = vim
          .iter(formatters)
          :filter(function(x)
            return x.available
          end)
          :map(function(x)
            return x.name
          end)
          :join(',')
        return '󰉢  ' .. x
      end

      local lint_progress = function()
        local linters = require('lint').get_running()
        if #linters == 0 then
          return '󰦕 '
        end
        return '󱉶 ' .. table.concat(linters, ', ') .. ' '
      end

      local new_opts = vim.tbl_deep_extend('force', opts, {
        sections = {
          lualine_y = vim.iter({ opts.sections.lualine_y, { current_formatter, lint_progress } }):flatten():totable(),
        },
      })

      require('lualine').setup(new_opts)
    end,
  },
}
