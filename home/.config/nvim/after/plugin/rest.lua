require("rest-nvim").setup()

vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('RestNvimAUGroup', { clear = true }),
  pattern = "*.http",
  callback = function()
    vim.keymap.set("n", "<leader>h", "<Plug>RestNvim")
  end
})
