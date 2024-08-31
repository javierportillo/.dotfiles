vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- mouse sopport
vim.opt.mouse = 'a'
vim.opt.guicursor = 'a:blinkon1,n:block,i-ci-ve:ver25,r-cr-o:hor20'

vim.g.netrw_banner = 0

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
-- live substitution preview on a split
vim.opt.inccommand = 'split'
vim.opt.smartcase = true
vim.opt.breakindent = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.cursorline = true

-- make splits keep their size when others close
-- vim.opt.equalalways = false

-- dont show mode, it's already on the statusline
vim.opt.showmode = false

vim.opt.splitbelow = true
vim.opt.splitright = true

-- highlight matching paren
vim.opt.showmatch = true

-- visual block select all the block even on empty space and not just where text is
vim.opt.virtualedit = 'block'
