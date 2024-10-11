return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      require('render-markdown').setup({
        enabled = true,
        file_types = { 'markdown', 'vimwiki' },
        sign = {
          enabled = false,
        },
        heading = {
          position = 'inline',
          width = 'full',
        },
        code = {
          width = 'block',
          left_pad = 2,
          right_pad = 4,
          min_width = 50,
          position = 'right',
          language_pad = 1,
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
  {
    'arminveres/md-pdf.nvim',
    branch = 'main',
    lazy = true,
    keys = {
      {
        '<leader>,',
        function()
          require('md-pdf').convert_md_to_pdf()
        end,
        desc = 'Markdown preview',
      },
    },
    opts = {
      highlight = 'tango',
      toc = false,
      pandoc_user_args = {
        '--pdf-engine=pdflatex',
        '-V fontsize:6pt',
        '-V dpi:120',
        '-V geometry:margin=1in',
        '-V papersize:a4',
        '-V colorlinks=true',
        '-V linkcolor=blue',
        '-V urlcolor=red',
        '-V toccolor=gray',
      },
    },
  },
}
