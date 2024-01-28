vim.api.nvim_create_user_command("TexCompile", function()
  local current_buffer = vim.fn.expand("%")
  local command = "pdflatex -halt-on-error " .. current_buffer
  vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        print("pdflatex could not compile this file: " .. code)
      else
        print("PDF compiled.")
      end
    end
  })
end, {})

vim.api.nvim_create_user_command("TexCompileAndOpen", function()
  vim.cmd("TexCompile")
  local current_buffer = vim.fn.expand("%")
  local file_extension = vim.fn.expand("%:e")
  local pdf_file = current_buffer:gsub(file_extension .. "$", "pdf")
  -- yup, sadly, im running on windows using WSL, no other choise for now...
  local command = "SumatraPDF.exe -reuse-instance " .. pdf_file
  vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        print("SumatraPDF could not open this file: " .. code)
      else
        print("PDF compiled and opened in sumatra.")
      end
    end
  })
end, {})

vim.api.nvim_create_user_command("BibCompile", function()
  local file_name = vim.fn.expand("%:t:r")
  local command = "biber " .. file_name
  vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        print("biber could not compile ")
      else
        print("Biber compiled.")
      end
    end
  })
end, {})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("TexAutoCompile", { clear = true }),
  pattern = "*.tex",
  command = "TexCompile",
})

vim.keymap.set("n", "<leader>tl", "<cmd>TexCompileAndOpen<cr>", { buffer = true })
vim.keymap.set("n", "<leader>tt", "<cmd>TexCompile<cr>", { buffer = true })
vim.keymap.set("n", "<leader>tb", "<cmd>BibCompile<cr>", { buffer = true })

vim.opt.wrap = true
