require('luasnip.session.snippet_collection').clear_snippets('typescript')

local ls = require('luasnip')

local s = ls.snippet
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

ls.add_snippets('typescript', {
  s(
    { trig = 'cl', name = 'Console Log', desc = 'Prefixes the log with the variable name' },
    fmt("console.log('{}', {})", { rep(1), i(1, 'symbol') })
  ),
})
