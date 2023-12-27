-- This file will run only in neovide mode --
local status, gruvbox = pcall(require, "gruvbox")
if (not status) then return end


vim.g.neovide_transparency = 0.95
vim.o.guifont = "FiraCode Nerd Font:h14"

-- Floating Shadow
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

-- Blur
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

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
-- Calling ../after/plugin/neovide.lua for theme setting
