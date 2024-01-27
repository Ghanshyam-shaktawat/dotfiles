-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.mouse = ''

-- Ignore case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.wildignore:append({ '*/node_modules/*' })

-- Highlight the current cursor lines
vim.opt.cursorline = true

-- set Linebreak and indent on break on
vim.wo.linebreak = true
vim.wo.breakindent = true
vim.wo.breakindentopt = 'shift:2'

-- set wrap and text-width to 80
vim.opt.textwidth = 80
vim.opt.autoindent = true
vim.wo.wrap = true
