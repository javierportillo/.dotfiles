return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    dependencies = {
      'stevearc/conform.nvim',
      'mfussenegger/nvim-lint',
      'nvim-tree/nvim-web-devicons',
      'meuter/lualine-so-fancy.nvim',
    },
    config = function()
      require('lualine').setup({
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
          lualine_c = { { 'filename', path = 4 } },
          lualine_x = {
            'fancy_macro',
            'encoding',
            'fileformat',
            'filetype',
          },
          lualine_y = {
            'fancy_lsp_servers',
            'current_formatter',
            'lint_progress',
          },
          lualine_z = {
            { 'progress', padding = { left = 1, right = 0 } },
            { 'location', padding = { left = 0, right = 1 } },
          },
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
        tabline = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'fancy_cwd', { 'filename', path = 1 } },
          lualine_x = {},
          lualine_y = {},
          lualine_z = { { 'tabs', symbols = { modified = '' } } },
        },
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {},
      })
    end,
  },
}
