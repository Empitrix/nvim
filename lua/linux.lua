local status, gruvbox = pcall(require, "gruvbox")
if (not status) then return end

-- Gruvbox
gruvbox.setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = false,
  italic = {
    strings = false,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = true,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  contrast = "",
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = vim.g.neovide == nil,
  overrides = {
    CursorLineNr = { bg = "#1a1919", bold=false },
  }
})


-- if vim.g.neovide ~= nil then
--   vim.cmd("colorscheme gruvbox")
-- end


-- Bright & rounded borders for hover windows
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=#d3c6aa]])
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded"})

