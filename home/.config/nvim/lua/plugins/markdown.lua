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
      --- Set margins around document
      margins = '1.5cm',
      -- tango, pygments are quite nice for white on white
      highlight = 'tango',
      -- Generate a table of contents, on by default
      toc = false,
      -- Define a custom preview command, enabling hooks and other custom logic
      preview_cmd = function()
        return 'fix-md-pdf-wsl-path'
      end,
      -- if true, then the markdown file is continuously converted on each write, even if the
      -- file viewer closed, e.g., firefox is "closed" once the document is opened in it.
      ignore_viewer_state = true,
      -- Specify font, `nil` uses the default font of the theme
      -- fonts = nil,
      -- or, where all or only some options can be specified. NOTE: those that are `nil` can be left
      -- out completely
      fonts = {
        main_font = 'JetBrainsMonoNerdFontMono-Light.ttf',
      },
      -- Custom options passed to `pandoc` CLI call, can be ignored for setup
      -- pandoc_user_args = nil,
      -- or
      pandoc_user_args = {
        --   -- short
        --   '-V KEY[:VALUE]',
        --   -- long options
        --   '--standalone=[true|false]',
        '--pdf-engine=pdflatex',
        '-V fontsize:6pt',
        '-V dpi:120',
        '-V geometry:margin=0.5in',
        '-V papersize:a4',
        '-V colorlinks=true',
        '-V linkcolor=blue',
        '-V urlcolor=red',
        '-V toccolor=gray',
      },
    },
  },
}
