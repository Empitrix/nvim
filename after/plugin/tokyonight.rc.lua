local status, tokyonight = pcall(require, 'tokyonight')
if (not status) then return end

tokyonight.setup({
	style = "night",
	light_style = "day",
	transparent = vim.g.neovide ~= nil,
	terminal_colors = true,
	styles = {
		comments = { italic = false, bold = false },
		keywords = { italic = true, bold = false },
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	day_brightness = 0.3,
	dim_inactive = false,
	lualine_bold = false,
	on_colors = function(colors) end,
	on_highlights = function(highlights, colors) end,
	cache = true,
	plugins = {},
})


-- Will reapply the highlight *after* any colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("MyHighlightOverrides", { clear = true }),
	callback = function()
		vim.api.nvim_set_hl(0, "CursorLineNr", {
			fg = "#ED9413",
			bg = "#000000",
			bold = true,
		})
		vim.api.nvim_set_hl(0, "Visual", { reverse = true })
	end,
})
