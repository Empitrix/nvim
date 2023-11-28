" Copy text from visual mode to clipboard
vnoremap <Leader>y "+y
" Paste text from clipboard in normal mode
nnoremap <Leader>p "+p

"" Movement
" Insert mode mapping for Ctrl-j to move cursor down
inoremap <C-j> <Down>
" Insert mode mapping for Ctrl-k to move cursor up
inoremap <C-k> <Up>
" Insert mode mapping for Ctrl-l to move cursor right
inoremap <C-l> <Right>
" Insert mode mapping for Ctrl-h to move cursor left
inoremap <C-h> <Left>

" Tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>th :tabprevious<CR>
nnoremap <leader>tl :tabnext<CR>

" Exit from terminal focus
tnoremap <C-p> <C-\><C-n>
