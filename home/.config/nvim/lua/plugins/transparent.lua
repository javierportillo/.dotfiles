return {
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    opts = {
      extra_groups = {
        'Normal',
        'NotifyERRORBody',
        'NotifyWARNBody',
        'NotifyINFOBody',
        'NotifyDEBUGBody',
        'NotifyTRACEBody',
      },
      exclude_groups = {
        'CursorLine',
      },
    },
  },
}
