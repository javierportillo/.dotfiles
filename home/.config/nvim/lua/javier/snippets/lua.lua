require('luasnip.session.snippet_collection').clear_snippets('lua')

local ls = require('luasnip')

local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node

local fmt = require('luasnip.extras.fmt').fmt

local import = function(import_name)
  local parts = vim.split(import_name[1][1], '.', { plain = true })
  return parts[#parts] or ''
end

ls.add_snippets('lua', {
  s(
    { trig = 'req', name = 'Import Module', desc = 'Use only the last word of dot separated import name' },
    fmt("local {} = require('{}')", { f(import, { 1 }), i(1, 'module') })
  ),
})
