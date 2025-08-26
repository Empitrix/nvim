local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

-- Set compiler to zig (because it can regesiter for 64 bit widnows output)
if vim.fn.has('win32') == 1 then
	require 'nvim-treesitter.install'.compilers = { "zig" }
end

ts.setup {
	highlight = {
		enable = true,
		disable = {}
	},
	indent = {
		enable = true,
		disable = { "python", "cpp", "c", "html" },
	},
	ensure_installed = {
		-- -- 'tsx',
		'lua',
		'json',
		'css',
		'html',
		'python',
		-- 'dart'
	},
	-- autotag = { enable = true }
}
