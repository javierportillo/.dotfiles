return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('mini.align').setup()
      require('mini.indentscope').setup()
      require('mini.test').setup()

      -- Builtin text objects:
      -- b       = alias for )]}
      -- q       = alias for "'`
      -- ?       = user prompt for custom delimiter
      -- t       = html tag
      -- f       = function call (not the body)
      -- a       = function call argument
      -- default = any digit, punctuation or whitespace
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
          c = spec_treesitter({ a = '@comment.outer', i = '@comment.outer' }),
        },
      })
    end,
  },
}
