-- Center the screen when finding
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- next greatest remap ever : asbjornHaland
-- Leader Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to System Clipboard' })

-- Stop vim from freezing
vim.keymap.set('n', 'Q', '<nop>')

-- Paste last thing yanked, not deleted
vim.keymap.set({ 'n', 'v' }, ',p', [["0p]], { desc = 'Paste last yank' })

-- Tab Management
vim.keymap.set('n', 'tn', '<CMD>tabnew<CR>', { desc = 'Open New Tab' })
vim.keymap.set('n', 'tq', '<CMD>tabclose<CR>', { desc = 'Close Current Tab' })

-- Merge Conflict Resolution
vim.keymap.set('n', '<leader>mc', '<CMD>Gdiffsplit!<CR>', { desc = 'Open Merge Conflict' })
vim.keymap.set('n', '<leader>dgh', '<CMD>diffget //2<CR>', { desc = 'Fetch Hunk From HEAD' })
vim.keymap.set('n', '<leader>dgt', '<CMD>diffget //3<CR>', { desc = 'Fetch Hunk From Target' })

-- Get digraphs back cause <c-k> is already used to show function signatures
vim.keymap.set('i', '<c-u>', '<c-k>', { desc = 'Insert a Digraph' })

-- Clear last search highlights
vim.keymap.set('n', '<leader><ESC>', '<cmd>noh<cr>', { desc = 'Clear last search highlights' })

-- Zoom In on Split (Go back with <c-w> =)
vim.keymap.set('n', '<c-w>z', '<c-w>_<c-w>|', { desc = 'Zoom this split' })

-- Save with leader
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save File' })
