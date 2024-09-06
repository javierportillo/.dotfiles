local new_set = MiniTest.new_set
local expect, eq = MiniTest.expect, MiniTest.expect.equality

local child = MiniTest.new_child_neovim()

T = new_set({
  hooks = {
    ---@diagnostic disable-next-line: undefined-field
    pre_case = child.restart,
    ---@diagnostic disable-next-line: undefined-field
    post_case = child.stop,
  },
})

T['basics'] = new_set()

T['basics']['work'] = function()
  eq(1 + 1, 2)
end

T['basics']['some of this will fail'] = new_set({
  parametrize = { { 1 }, { 2 } },
}, {
  function(x)
    expect.error(function()
      eq(x, 1)
    end)
  end,
})

T['child'] = new_set({
  hooks = {
    pre_case = function()
      child.bo.readonly = false
    end,
  },
})

T['child']['manages child process'] = function()
  child.api.nvim_buf_set_lines(0, 0, -1, true, { 'aaa' })
  eq(child.api.nvim_buf_get_lines(0, 0, -1, true), { 'aaa' })
end

T['child']['allows screen test'] = function()
  child.o.lines, child.o.columns = 5, 12
  child.api.nvim_buf_set_lines(0, 0, -1, true, { 'aaa' })
  local ns_id = child.api.nvim_create_namespace('Example')
  child.highlight.range(0, ns_id, 'Special', { 0, 0 }, { 0, 1 }, {})

  expect.reference_screenshot(child.get_screenshot)
end

return T
