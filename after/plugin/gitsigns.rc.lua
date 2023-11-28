local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

gitsigns.setup {
  current_line_blame_opts = {
    delay = 1000,
  },
  -- Default: 100,
  update_debounce = 300,
}
