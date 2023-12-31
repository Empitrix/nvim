local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

-- Set compiler to zig (because it can regesiter fo 64 bit widnows outptu)
if vim.fn.has('win32') == 1 then
  -- Only in windows using 64
  require 'nvim-treesitter.install'.compilers = { "zig" }
end

ts.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    -- -- 'tsx',
    'lua',
    'json',
    'css',
    'python',
    -- 'dart'
  },
  autotag = {
    enable = true,
  }
}
