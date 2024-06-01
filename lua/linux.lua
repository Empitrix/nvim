-- This file will run only in neovide mode --
local status, gruvbox = pcall(require, "gruvbox")
if (not status) then return end

-- Gruvbox
gruvbox.setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = false,      -- Don't bold any type of func etc...
  italic = {
    strings = false, -- default: true
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "",  -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false, -- Using default neovide background transparency
})


if vim.g.neovide ~= nil then
  vim.cmd("colorscheme gruvbox")
end

