local lsp = require("lsp-zero").preset({
  name = 'minimal',
  float_border = false,
})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr, omit = { '<F3>', 'gl' } })

  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { buffer = true })
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { buffer = true })
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = true })
  vim.keymap.set("n", "gl", "<cmd>Telescope diagnostics<cr>", { buffer = true })
end)

lsp.set_sign_icons({
  error = 'x',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.ensure_installed({
  "lua_ls",
})

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

require("lspconfig").yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/docker-compose.yml",
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
      },
    }
  }
})

lsp.format_mapping('<F3>', {
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['dockerls'] = { 'dockerfile' },
    ['lua_ls'] = { 'lua' },
    ['eslint'] = { 'typescript' },
    ['null-ls'] = { 'yaml', 'markdown', 'html', 'sh', 'tex', 'bib'},
  }
})

lsp.setup()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  preselect = cmp.PreselectMode.Item,
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-space>"] = cmp.mapping.complete(),
    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = "menu,preview,menuone,noinsert"
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = require("lspkind").cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
  sources = {
    { name = "nvim_lsp", group_index = 1 },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer",   keyword_length = 5, group_index = 2 },
  },
  view = {
    entries = {
      name = "custom",
      selection_order = "near_cursor"
    },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.beautysh,
    null_ls.builtins.formatting.latexindent,
    null_ls.builtins.formatting.bibclean,
  }
})
