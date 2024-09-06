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
        template = 'daily.md',
      },

      completion = {
        nvim_cmp = true,
      },

      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ''
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. '-' .. suffix
      end,

      wiki_link_func = function(opts)
        return require('obsidian.util').wiki_link_id_prefix(opts)
      end,

      preferred_link_style = 'wiki',

      templates = {
        folder = 'templates',
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

      attachments = {
        img_folder = 'pictures',
      },
    },
  },
}
