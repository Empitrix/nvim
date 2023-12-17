local status, saga = pcall(require, 'lspsaga')
if (not status) then return end
--
-- saga.init_lsp_saga {
--   error_sign = '',
--   warn_sign = '',
--   hint_sign = '',
--   infor_sign = '',
-- }

--
-- -- saga.init_lsp_saga {
saga.setup {
  -- server_filetype_map = {}
}
--
--
--
--
-- local opts = { noremap = true, silent = true }
-- -- vim.keymap.set('n', '<C-j>', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
-- -- vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
-- vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<cr>', opts)
-- -- vim.keymap.set('i', '<C-k>', '<cmd>Lspsaga signature_help<cr>', opts)
-- -- -- vim.keymap.set('n', 'gp', '<cmd>Lspsaga preview_definition<cr>', opts)
-- -- -- vim.keymap.set('n', 'gp', '<cmd>Lspsaga peek_definition<cr>', opts)
-- -- vim.keymap.set('n', 'gp', '<cmd>Lspsaga peek_type_definition<cr>', opts)
-- -- vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<cr>', opts)
