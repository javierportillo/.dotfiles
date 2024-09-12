return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup({
        cmdline = {
          enabled = true,
          view = 'cmdline_popup',
          format = {
            cmdline = { icon = ' ' },
            search_down = { icon = '   ' },
            search_up = { icon = '  󰄿 ' },
          },
        },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            -- ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            -- ['vim.lsp.util.stylize_markdown'] = true,
            -- ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = false, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = true, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        views = {
          cmdline_popup = {
            border = {
              padding = { 1, 2 },
              style = 'none',
            },
            win_options = {
              winhighlight = { Normal = 'NormalFloat', FloatBorder = 'FloatBorder' },
            },
          },
          mini = {
            win_options = {
              winblend = 0,
            },
          },
          hover = {
            view = 'popup',
            relative = 'cursor',
            zindex = 45,
            enter = false,
            anchor = 'auto',
            size = {
              width = 'auto',
              height = 'auto',
              max_width = 120,
              max_height = 20,
            },
            boder = {
              style = 'none',
              padding = { 0, 2 },
            },
            position = { row = 1, col = 0 },
            win_options = {
              wrap = true,
              linebreak = true,
            },
          },
        },
      })

      ---@diagnostic disable-next-line: missing-fields
      require('notify').setup({
        background_color = 'Normal',
        render = 'wrapped-compact',
        stages = 'static',
        on_open = function(win)
          vim.api.nvim_win_set_config(win, {
            border = {
              { '┌', 'Normal' },
              { '─', 'Normal' },
              { '┐', 'Normal' },
              { '│', 'Normal' },
              { '┘', 'Normal' },
              { '─', 'Normal' },
              { '└', 'Normal' },
              { '│', 'Normal' },
            },
          })
        end,
      })

      vim.keymap.set({ 'n', 'i', 's' }, '<c-f>', function()
        if not require('noice.lsp').scroll(4) then
          return '<c-f>'
        end
      end, { silent = true, expr = true })

      vim.keymap.set({ 'n', 'i', 's' }, '<c-b>', function()
        if not require('noice.lsp').scroll(-4) then
          return '<c-b>'
        end
      end, { silent = true, expr = true })
    end,
  },
}
