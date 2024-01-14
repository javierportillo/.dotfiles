return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'onsails/lspkind.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'b0o/schemastore.nvim',
      {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
      },
    },
    config = function ()

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
  warn = '!',
  hint = 'i',
  info = 'i'
})

lsp.ensure_installed({
  "lua_ls",
  "bashls",
  "dockerls",
  "eslint",
  "marksman",
  "texlab",
  "tsserver",
  "yamlls",
  "jsonls",
  "prismals",
  "volar",
})

-- (Optional) Configure lua language server for neovim
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.yamlls.setup({
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
      },
      schemas = require("schemastore").yaml.schemas(),
    }
  }
})

lspconfig.jsonls.setup({
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    }
  }
})

lspconfig.helm_ls.setup({
  filetypes = { "helm" },
  cmd = { "helm_ls", "serve" }
})

lsp.format_mapping('<F3>', {
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['dockerls'] = { 'dockerfile' },
    ['lua_ls'] = { 'lua' },
    -- ['eslint'] = { 'typescript', 'typescriptreact', 'typescript.tsx' },
    ['null-ls'] = { 'yaml', 'markdown', 'html', 'sh', 'tex', 'bib', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue' },
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
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer",  keyword_length = 5 },
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
    end
  },
}
