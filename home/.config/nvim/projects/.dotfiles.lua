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
  local command = "cd $HOME && rsync .dotfiles/home/.config/wezterm/.wezterm.png winhome/ && rsync .dotfiles/home/.config/wezterm/.wezterm.lua winhome/"
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
