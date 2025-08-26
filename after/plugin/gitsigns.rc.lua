local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

gitsigns.setup {
	update_debounce = 300,
	current_line_blame_opts = {
		delay = 1000,
	},
	signs = {
		delete = { text = "" }
	}
}
