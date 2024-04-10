vim.cmd("autocmd!")

vim.scriptencoding = "UTF-8"
vim.opt.encoding = "UTF-8"
vim.opt.fileencoding = "UTF-8"

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
-- expandtab is by default true but you can
-- override it for any languages in ./after/ftplugin/<lang>.vim
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = vim.fn.has('win32') == 1 and "pwsh" or "bash" -- cmd
vim.opt.backupskip = "/tmp/*,/private/tmp/*"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true            -- Auto indent
vim.opt.si = true            -- Smart indent
vim.opt.wrap = false         -- No wrap lines
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- but this doesn't work on iTerm2.

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste"
})

-- Auto-command to turn off line numbers in terminal mode
vim.cmd([[
  autocmd TermOpen * setlocal nonumber
  autocmd TermClose * setlocal number
]])


vim.cmd([[
  autocmd FileType c setlocal shiftwidth=2 tabstop=2 noexpandtab
  autocmd FileType c set noexpandtab
]])

vim.api.nvim_command([[
  autocmd FileType c set noexpandtab
]])

print("Auto cmd works loaded");

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
