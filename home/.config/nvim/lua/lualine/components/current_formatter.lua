local M = require('lualine.component'):extend()

-- [[
-- requires conform.nvim as dependency
-- dependencies = {
--   'stevearc/conform.nvim',
-- }
-- ]]

local default_options = {
  icon = '󰉢  ',
  split = ',',
  padding = { left = 0, right = 1 },
}

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend('keep', self.options or {}, default_options)
end

function M:update_status()
  local formatters = require('conform').list_formatters_to_run()
  if #formatters == 0 then
    return ''
  end

  local x = vim
    .iter(formatters)
    :filter(function(x)
      return x.available
    end)
    :map(function(x)
      return x.name
    end)
    :join(self.options.split)
  return self.options.icon .. x
end

function M:apply_icon() end

return M
