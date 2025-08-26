local status, bufferline = pcall(require, 'bufferline')
if not status then return end

bufferline.setup {
	options = {
		mode = 'tabs',
		themable = true,
		show_duplicate_prefix = false,
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
	},
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
