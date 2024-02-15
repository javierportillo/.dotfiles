return {

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
    },
    keys = {
      '<leader>trr', -- test runner run
      '<leader>trs', -- test runner stop
      '<leader>trf', -- test runner file
      '<leader>trt', -- test runner toggle summary
    },
    config = function()
      require("neotest").setup({
        discovery = {
          enabled = false,
        },
        adapters = {
          require('neotest-jest')({
            jestCommand = "npm run test -- --collectCoverage=false",
            env = { CI = true },
            ---@diagnostic disable-next-line: unused-local
            cwd = function(path)
              return vim.fn.getcwd()
            end,
            jest_test_discovery = false,
          })
        },
      })


      local neotest = require('neotest')

      vim.keymap.set('n', '<leader>trr', function() neotest.run.run() end)
      vim.keymap.set('n', '<leader>trs', function() neotest.run.stop() end)
      vim.keymap.set('n', '<leader>trf', function() neotest.run.run(vim.fn.expand("%")) end)
      vim.keymap.set('n', '<leader>trt', function() neotest.summary.toggle() end)
    end,
  },
}
