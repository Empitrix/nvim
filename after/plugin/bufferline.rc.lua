local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

-- Check for if it's neovide
local isN = vim.g.neovide == nil


bufferline.setup {
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = isN and "#073642" or "#A89984",
      bg = isN and "#002b36" or "#504945"
    },
    separator_selected = {
      fg = isN and "#073642" or "#A89984"
    },
    background = {
      fg = isN and "#657b83" or "#A89984",
      bg = isN and "#002b36" or "#504945"
    },
    buffer_selected = {
      fg = "#fdf6e3",
      gui = "bold"
    },
    fill = {
      bg = isN and "#073642" or "#504945"
    }
  }
}


vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
