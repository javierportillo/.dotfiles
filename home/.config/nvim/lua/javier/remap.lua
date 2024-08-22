-- Center the screen when finding
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- next greatest remap ever : asbjornHaland
-- Leader Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to System Clipboard' })

-- Stop vim from freezing
vim.keymap.set('n', 'Q', '<nop>')

-- Swap ; for : in visual and normal
vim.keymap.set({ 'n', 'v' }, ';', ':')
vim.keymap.set({ 'n', 'v' }, ':', ';')

-- Paste last thing yanked, not deleted
vim.keymap.set({ 'n', 'v' }, ',p', [["0p]], { desc = 'Paste last yank' })

-- Tab Management
vim.keymap.set('n', '<leader>tn', '<CMD>tabnew<CR>', { desc = 'Open New Tab' })
vim.keymap.set('n', '<leader>tq', '<CMD>tabclose<CR>', { desc = 'Close Current Tab' })
