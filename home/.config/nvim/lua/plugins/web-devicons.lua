return {
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({
        -- your personnal icons can go here (to override)
        -- you can specify color or cterm_color instead of specifying both of them
        -- DevIcon will be appended to `name`
        override = {
          zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
          },
          dockerfile = {
            icon = "",
            color = "#458ee6",
            cterm_color = "68",
            name = "Dockerfile"
          },
          tex = {
            icon = "T",
            color = "#3d6117",
            cterm_color = "22",
            name = "DevIconTex"
          },
        },
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true,
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = false,
        -- globally enable "strict" selection of icons - icon will be looked up in
        -- different tables, first by filename, and if not found by extension; this
        -- prevents cases when file doesn't have any extension but still gets some icon
        -- because its name happened to match some extension (default to false)
        strict = true,
        -- same as `override` but specifically for overrides by filename
        -- takes effect when `strict` is true
        override_by_filename = {
          [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
          },
          ["dockerfile"] = {
            icon = "",
            color = "#458ee6",
            cterm_color = "68",
            name = "Dockerfile"
          },
          ["docker-compose.yml"] = {
            icon = "",
            color = "#458ee6",
            cterm_color = "68",
            name = "Dockerfile"
          },
          ["docker-compose.yaml"] = {
            icon = "",
            color = "#458ee6",
            cterm_color = "68",
            name = "Dockerfile"
          },
          [".dockerignore"] = {
            icon = "",
            color = "#458ee6",
            cterm_color = "68",
            name = "Dockerfile"
          },
        },
        -- same as `override` but specifically for overrides by extension
        -- takes effect when `strict` is true
        override_by_extension = {
          ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log"
          },
          ['tex'] = {
            icon = "T",
            color = "#3d6117",
            cterm_color = "22",
            name = "DevIconTex"
          },
          ['xml'] = {
            icon = "",
            color = "#c4d520",
            name = "DevIconXml"
          },
          ['prisma'] = {
            icon = "",
            color = "#ffffff",
            name = "DevIconPrisma"
          },
        },
      })
    end
  }
}
