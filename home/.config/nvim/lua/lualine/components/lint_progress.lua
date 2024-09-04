local M = require('lualine.component'):extend()

-- [[
-- dependencies = {
--   'mfussenegger/nvim-lint',
-- }
-- ]]

local default_options = {
  icon = '󰦕 ',
  icon_running = '󱉶 ',
  split = ', ',
  padding = { left = 1, right = 1 },
}

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend('keep', self.options or {}, default_options)
end

function M:update_status()
  local linters = require('lint').get_running()
  if #linters == 0 then
    return self.options.icon
  end
  return self.options.icon_running .. table.concat(linters, self.options.split)
end

function M:apply_icon() end

return M
