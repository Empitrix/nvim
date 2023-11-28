require("base")
require("highlights")
require("plugins")
require("maps")

local has = function(x)
  return vim.fn.has(x) == 1
end


if has "win32" then
  require("windows")
end

