return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    event = 'VeryLazy',
    -- ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   'BufReadPre /mnt/c/Users/javie/Google Drive/obsidian/My Second Brain/*.md',
    --   'BufNewFile /mnt/c/Users/javie/Google Drive/obsidian/My Second Brain/*.md',
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'Second Brain',
          path = '/mnt/c/Users/javie/Google Drive/obsidian/My Second Brain',
        },
      },
      daily_notes = {
        folder = 'daily',
        default_tags = { 'daily' },
      },
      completion = {
        nvim_cmp = true,
      },
      follow_url_func = function(url)
        vim.fn.jobstart({ 'xdg-open', url })
      end,
      follow_img_func = function(url)
        vim.fn.jobstart({ 'xdg-open', url })
      end,
      picker = {
        name = 'telescope.nvim',
      },
    },
  },
}
