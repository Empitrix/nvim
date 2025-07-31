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
-- vim.cmd([[ set clipboard=unnamedplus ]]) -- for 'copy' in arch (xclip)

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
keymap.set('n', '<C-w><down>', '<C-w>+')
keymap.set('n', '<C-w><up>', '<C-w>-')

-- keymap.set('n', '<leader>h', '<C-w><')
-- keymap.set('n', '<leader>l', '<C-w>>')
-- keymap.set('n', '<leader>k', '<C-w>+')
-- keymap.set('n', '<leader>j', '<C-w>-')

keymap.set("n", "<leader>h", '<cmd>vertical resize -3<cr>')
keymap.set("n", "<leader>l", '<cmd>vertical resize +3<cr>')
keymap.set("n", "<leader>k", '<cmd>horizontal resize -3<cr>')
keymap.set("n", "<leader>j", '<cmd>horizontal resize +3<cr>')


-- Move between tabs and creat/close them
keymap.set('n', '<leader>tn', ':tabnew<CR>', opts)
keymap.set('n', '<leader>tc', ':tabclose<CR>', opts)
keymap.set('n', '<leader>th', ':tabprevious<CR>', opts)
keymap.set('n', '<leader>tl', ':tabnext<CR>', opts)

-- Move tabs postions (Right/Left)
keymap.set('n', '<leader>ml', ':+tabmove<CR>', opts)
keymap.set('n', '<leader>mh', ':-tabmove<CR>', opts)

-- Open a terminal
keymap.set('n', '<leader>T', ':tabnew Terminal<CR>:terminal<CR>', opts)

-- Show dialgnostics by a floting window (lspconfig)
vim.keymap.set('n', '<C-l>', "<cmd>:lua vim.diagnostic.open_float()<cr>")


-- Extend Selection
keymap.set('n', '<leader>ha', '"_y[{V%', opts)
-- Tip: for indent then you can use (v to come back one) and use > or < for indnet forward/backward
-- Set keep visual mode after indentation
keymap.set('v', '>', '>gv', opts)
keymap.set('v', '<', '<gv', opts)


-- Full Screen for neovide if its possible
if vim.g.neovide == true then
	vim.api.nvim_set_keymap(
		'n', '<F11>',
		":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end



keymap.set('', '<leader>dl', '$') -- go to end
keymap.set('', '<leader>dh', '^') -- go to start
keymap.set('', '<leader>dl', '$') -- go to end
keymap.set('', '<leader>dh', '^') -- go to start

-- for () [] {}
keymap.set('n', '<leader>sa', 'v%')  -- select till end/start (if in the beggining / end)
keymap.set('', '<leader>gb', '%')    -- got to the begining / or end
keymap.set('n', '<leader>ga', '%v%') -- go to the start/begging and select all of it


keymap.set('n', '<leader>tt', ':Telescope<CR>', opts) -- open 'Telescope'

-- Smooth scroll down
vim.api.nvim_set_keymap('', '<C-j>', '4<C-e>', opts)
-- Smooth scroll up
vim.api.nvim_set_keymap('', '<C-k>', '4<C-y>', opts)

vim.opt.updatetime = 200 -- default is 4000ms, reducing to 200ms

-- List all of the functions (useful for headers)
keymap.set('n', '<leader>laf', ':g/^\\(void\\|int\\|char \\*\\*\\|char\\)\\s\\+\\w\\+(/p<CR>', opts)

vim.keymap.set('n', '<leader>fd', '<cmd>lua require("telescope.builtin").fd()<cr>',
	opts)
