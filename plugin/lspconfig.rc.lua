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
  -- on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.html.setup {
  capabilities = capabilities,
}

-- HTML Snippet (https://github.com/aca/emmet-ls)
nvim_lsp.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  -- filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
  -- filetypes = { "css", "html", "vue" },
  filetypes = { "html", "htmldjango", "typescript.tsx" },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})


-- css
--Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- same capabilities as html
nvim_lsp.cssls.setup {
  capabilities = capabilities,
}


-- function leave_snippet()
--   if
--       ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
--       and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
--       and not require('luasnip').session.jump_active
--   then
--     require('luasnip').unlink_current()
--   end
-- end
--
-- -- stop snippets when you leave to normal mode
-- vim.api.nvim_command([[
--     autocmd ModeChanged * lua leave_snippet()
-- ]])



-- Rust
nvim_lsp.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        -- enable = false,
        enable = true,
      },
      -- completion = {
      --   completionItem = {
      --     snippetSupport = true
      --   }
      -- }
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

-- Dartls already added by "flutter-tools"
-- -- Dart
-- nvim_lsp.dartls.setup {
--   -- on_attach = on_attach,
--   cmd = { "dart", "language-server", "--protocol=lsp" },
--   filetypes = { "dart" },
--   init_options = {
--     closingLabels = true,
--     flutterOutline = true,
--     onlyAnalyzeProjectsWithOpenFiles = true,
--     outline = true,
--     suggestFromUnimportedLibraries = true
--   },
--   settings = {
--     dart = {
--       completeFunctionCalls = true,
--       showTodos = true
--     }
--   },
-- }


-- Java
-- nvim_lsp.java_language_server.setup {}
--
nvim_lsp.jdtls.setup {
  capabilities = capabilities,
}


-- C/C++
-- nvim_lsp.ccls.setup {}
nvim_lsp.clangd.setup {
  capabilities = capabilities,
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

-- See ':hi' in buffer for colors
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = true,
    signs = true,
    update_in_insert = false, -- Good for performancep
    underline = true,
  }
)

-- Set virtual_text prefix icon
vim.diagnostic.config({
  virtual_text = {
    prefix = " ",
  },
})
