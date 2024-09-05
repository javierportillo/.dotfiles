local M = require('lualine.component'):extend()

-- [[
-- dependencies = {
--   'epwalsh/pomo.nvim',
-- }
-- ]]

local default_options = {
  icon = '󰄉 ',
  padding = { left = 1, right = 1 },
}

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend('keep', self.options or {}, default_options)
end

function M:update_status()
  local ok, pomo = pcall(require, 'pomo')
  if not ok then
    return ''
  end

  local timer = pomo.get_first_to_finish()
  if timer == nil then
    return ''
  end

  return self.options.icon .. tostring(timer)
end

function M:apply_icon() end

return M
