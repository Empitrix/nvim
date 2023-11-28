local keymap = vim.keymap
vim.g.mapleader = " "

-- Movement in __INSERT__ mode
keymap.set("i", "<C-j>", "<DOWN>")
keymap.set("i", "<C-k>", "<UP>")
keymap.set("i", "<C-l>", "<RIGHT>")
keymap.set("i", "<C-h>", "<LEFT>")

-- Copy && Paste
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', { noremap = true })

-- Exit Termianl mode
vim.cmd [[ tnoremap <C-p> <C-\><C-n> ]]
vim.cmd [[ tnoremap <Esc> <C-\><C-n> ]]

-- Clear search buffer
vim.cmd [[command! ClearSearch let @/ = ""]]

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
local opts = { noremap = false, silent = true }
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnew<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tc', ':tabclose<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>th', ':tabprevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tl', ':tabnext<CR>', opts)
