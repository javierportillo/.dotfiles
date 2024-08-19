return {
  {
    "nvim-neorg/neorg",
    enabled = false,
    build = ":Neorg sync-parsers",
    -- tag = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.summary"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.dirman"] = {      -- Manages Neorg workspaces
            config = {
              workspaces = {
                work = "~/Documents/neorg/notes/work",
                home = "~/Documents/neorg/notes/home",
              },
              default_workspace = "home",
            },
          },
        },
      }
      vim.keymap.set('n', '<leader>nwh', '<cmd>Neorg workspace home<cr>')
      vim.keymap.set('n', '<leader>nww', '<cmd>Neorg workspace work<cr>')
      vim.keymap.set('n', '<leader>nwi', '<cmd>Neorg index<cr>')
      vim.keymap.set('n', '<leader>ncl', '<cmd>Neorg return<cr>')
    end,
  },
}
