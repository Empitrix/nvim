local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

gitsigns.setup {
  -- Default: 100,
  update_debounce = 300,
  current_line_blame_opts = {
    delay = 1000,
  },
  signs = {
    delete = { text = "" } -- Smaller: 
    -- add          = { text = '│' },
    -- change       = { text = '│' },
    -- topdelete    = { text = '‾' },
    -- changedelete = { text = '~' },
    -- untracked    = { text = '┆' },
  }
}
