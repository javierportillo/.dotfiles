return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('mini.align').setup()

      local spec_treesitter = require('mini.ai').gen_spec.treesitter
      require('mini.ai').setup({
        custom_textobjects = {
          -- whole buffer
          g = function()
            local from = { line = 1, col = 1 }
            local to = {
              line = vim.fn.line('$'),
              col = math.max(vim.fn.getline('$'):len(), 1),
            }
            return { from = from, to = to }
          end,
          F = spec_treesitter({ a = '@function.outer', i = '@function.inner' }),
          o = spec_treesitter({
            a = { '@conditional.outer', '@loop.outer' },
            i = { '@conditional.inner', '@loop.inner' },
          }),
        },
      })
    end,
  },
}
