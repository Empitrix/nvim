-- This file will run only in neovide mode --
local status, gruvbox = pcall(require, "gruvbox")
if (not status) then return end


vim.g.neovide_transparency = 0.8
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
  transparent_mode = false, -- Using default neovide transparency
})
-- Calling ../after/plugin/neovide.lua for theme setting
