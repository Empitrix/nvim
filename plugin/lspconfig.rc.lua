local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    -- vim.api.nvim_command [[autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format() ]]
    vim.api.nvim_command [[augroup END]]
  end
end
-- Typescript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- Rust
nvim_lsp.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        -- enable = false,
        enable = true,
      }
    }
  }
}


-- Python
nvim_lsp.pyright.setup {
  on_attach = on_attach,
  filetypes = { "python" },
  cmd = { 'pyright-langserver', '--stdio' },
}
-- Lua
nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the 'vim' global
        globals = { 'vim' }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
}

-- Dart
nvim_lsp.dartls.setup {
  on_attach = on_attach,
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true
    }
  },
}
-- vim.cmd [[ let g:loaded_syntastic_dart_dartanalyzer_checker = 0 ]]

-- Apply icons
-- From: https://github.com/folke/trouble.nvim/issues/96
local signs = { Error = '󰅙 ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  -- default: numhl = ''
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- Show dialgnostics on full-size
vim.keymap.set('n', '<C-l>', "<cmd>:lua vim.diagnostic.open_float()<cr>")
