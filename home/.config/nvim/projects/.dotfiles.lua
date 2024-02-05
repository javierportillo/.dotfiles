vim.api.nvim_create_user_command("SyncAlacritty", function()
  local command = "cd $HOME && rsync .dotfiles/home/.config/alacritty/alacritty.yml winhome/AppData/Roaming/alacritty/"
  vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        print("could not sync alacritty to windows")
      else
        print("synced alacritty to windows")
      end
    end
  })
end, {})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AutoSyncAlacritty", { clear = true }),
  pattern = "alacritty.yml",
  command = "SyncAlacritty",
})


vim.api.nvim_create_user_command("SyncWezterm", function()
  local command =
  "cd $HOME && rsync .dotfiles/home/.config/wezterm/.wezterm.png winhome/ && rsync .dotfiles/home/.config/wezterm/.wezterm.lua winhome/"
  vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        print("could not sync wezterm to windows")
      else
        print("synced wezterm to windows")
      end
    end,
  })
end, {})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AutoSyncWezterm", { clear = true }),
  pattern = ".wezterm.lua",
  command = "SyncWezterm",
})

vim.api.nvim_create_user_command("SyncKomorebi", function()
  local command = "cd $HOME && rsync .dotfiles/home/.config/komorebi/komorebi.json winhome/"
  vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        print("could not sync komorebi to windows")
      else
        print("synced komorebi to windows")
      end
    end,
  })
end, {})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AutoSyncKomorebi", { clear = true }),
  pattern = "komorebi.json",
  command = "SyncKomorebi",
})

vim.api.nvim_create_user_command("SyncWhkd", function()
  local command = "cd $HOME && rsync .dotfiles/home/.config/komorebi/whkdrc winhome/.config/"
  vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        print("could not sync whkdr to windows")
      else
        print("synced whkdr to windows")
      end
    end,
  })
end, {})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AutoSyncWhkd", { clear = true }),
  pattern = "whkdrc",
  command = "SyncWhkd",
})

vim.api.nvim_create_user_command("SyncApplications", function()
  local command = "cd $HOME && rsync .dotfiles/home/.config/komorebi/applications.yaml winhome/"
  vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        print("could not sync applications to windows")
      else
        print("synced applications to windows")
      end
    end,
  })
end, {})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AutoSyncApplications", { clear = true }),
  pattern = "applications.yaml",
  command = "SyncApplications",
})

vim.api.nvim_create_user_command("SyncYasb", function()
  local command =
  "cd $HOME && rsync .dotfiles/home/.config/yasb/yasb.yaml winhome/.yasb/config.yaml && rsync .dotfiles/home/.config/yasb/yasb.css winhome/.yasb/styles.css"
  vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        print("could not sync yasb to windows")
      else
        print("synced yasb to windows")
      end
    end,
  })
end, {})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AutoSyncYasb", { clear = true }),
  pattern = "yasb.yaml",
  command = "SyncYasb",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AutoSyncYasbCSS", { clear = true }),
  pattern = "yasb.css",
  command = "SyncYasb",
})
