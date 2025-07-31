require("base")
require("highlights")
require("plugins")
require("maps")

-- Neovide configuration
if vim.g.neovide ~= nil then
	require("neovide")
end

local has = function(x)
	return vim.fn.has(x) == 1
end


if has "win32" then
	require("windows")
else
	require("linux")
end

require("luasnip.loaders.from_vscode").lazy_load()
