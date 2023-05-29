local function compileToPDF()
  local current_buffer = vim.fn.expand("%")
  print("compiling to pdf: " .. current_buffer)
  local command = "pdflatex -halt-on-error " .. current_buffer
  vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        print("pdflatex could not compile this file: " .. code)
      end
    end
  })
end

vim.keymap.set("n", "<leader>tl", function()
  compileToPDF()
  local current_buffer = vim.fn.expand("%")
  local file_extension = vim.fn.expand("%:e")
  local pdf_file = current_buffer:gsub(file_extension .. "$", "pdf")
  -- yup, sadly, im running on windows using WSL, no other choise for now...
  local command = "SumatraPDF.exe -reuse-instance " .. pdf_file
  vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        print("SumatraPDF could not open this file: " .. code)
      end
    end
  })
end, { buffer = true })


vim.keymap.set("n", "<leader>tt", compileToPDF, { buffer = true })

vim.keymap.set("n", "<leader>tb", function()
  local file_name = vim.fn.expand("%:t:r")
  local command = "biber " .. file_name
  print("compiling bibliographic references...")
  vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        print("biber could not compile ")
      end
    end
  })
end, { buffer = true })

vim.opt.wrap = true
