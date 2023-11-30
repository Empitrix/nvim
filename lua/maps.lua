local keymap = vim.keymap
vim.g.mapleader = " "
local opts = { noremap = false, silent = true }

-- Movement in __INSERT__ mode
keymap.set("i", "<C-j>", "<DOWN>")
keymap.set("i", "<C-k>", "<UP>")
keymap.set("i", "<C-l>", "<RIGHT>")
keymap.set("i", "<C-h>", "<LEFT>")

-- Copy && Paste
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', opts)
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', opts)

-- Exit Termianl mode
keymap.set('t', '<C-p>', '<C-\\><C-n>', opts)
keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)

-- Clear search buffer: command & shortcut
vim.cmd [[command! ClearSearch let @/ = ""]]
keymap.set('n', '<Leader>cs', '<cmd>let @/ = ""<cr>', opts)

-- Retab all: will retab all the indent from sapce to tab if noexpandtab
vim.cmd [[command! RetabAll %retab!]]
keymap.set('n', '<Leader>ta', '<cmd>%retab!<cr>', opts)

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- Split windows
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
keymap.set('n', '<leader>h', '<C-w><')
keymap.set('n', '<leader>l', '<C-w>>')
keymap.set('n', '<leader>k', '<C-w>+')
keymap.set('n', '<leader>j', '<C-w>-')

-- Move between tabs and creat/close them
keymap.set('n', '<leader>tn', ':tabnew<CR>', opts)
keymap.set('n', '<leader>tc', ':tabclose<CR>', opts)
keymap.set('n', '<leader>th', ':tabprevious<CR>', opts)
keymap.set('n', '<leader>tl', ':tabnext<CR>', opts)

-- Move tabs postions (Right/Left)
keymap.set('n', '<leader>ml', ':+tabmove<CR>', opts)
keymap.set('n', '<leader>mh', ':-tabmove<CR>', opts)
