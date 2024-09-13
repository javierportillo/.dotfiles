return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      require('render-markdown').setup({
        enabled = true,
        acknowledge_conflicts = true,
        file_types = { 'markdown', 'vimwiki' },
        only_render_image_at_cursor = true,
        heading = {
          position = 'inline',
        },
        quote = { repeat_linebreak = true },
        win_options = {
          showbreak = { default = '', rendered = '  ' },
          breakindent = { default = false, rendered = true },
          breakindentopt = { default = '', rendered = '' },
        },
        checkbox = {
          enabled = true,
          position = 'overlay',
          custom = {
            todo = { raw = '[-]', rendered = '󱋭 ', highlight = 'Conceal' },
            incomplete = { raw = '[/]', rendered = '󰡖 ', highlight = '@punctuation' },
            question = { raw = '[?]', rendered = ' ', highlight = '@keyword.debug' },
            warning = { raw = '[!]', rendered = ' ', highlight = '@comment.warning' },
            sent = { raw = '[>]', rendered = ' ', highlight = '@comment.note' },
          },
        },
        latex = {
          enabled = true,
          converter = 'latex2text',
          highlight = 'RenderMarkdownMath',
          top_pad = 0,
          bottom_pad = 0,
        },
      })
      vim.treesitter.language.register('markdown', 'vimwiki')
    end,
  },
}
