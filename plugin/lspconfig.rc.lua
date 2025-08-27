---@diagnostic disable: undefined-global
local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

-- Loading flutter-tools
local status_flt, flutter_tools = pcall(require, 'flutter-tools')
if (not status_flt) then return end


-- local protocol = require('vim.lsp.protocol')

local on_attach = function(client, _)
	-- formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		-- vim.api.nvim_command [[autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_seq_sync()]]
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format() ]]
		vim.api.nvim_command [[augroup END]]
	end
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- -- Typescript
-- nvim_lsp.tsserver.setup {
-- 	capabilities = capabilities,
-- 	settings = {
-- 		completions = {
-- 			completeFunctionCalls = true
-- 		}
-- 	},
-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
-- 	cmd = { "typescript-language-server", "--stdio" }
-- }


-- HTML
nvim_lsp.emmet_language_server.setup {
	capabilities = capabilities,
	filetypes = { "html", "htmldjango" },
}

-- CSS
nvim_lsp.cssls.setup {
	capabilities = capabilities,
}

-- Rust
nvim_lsp.rust_analyzer.setup {
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true,
			},
		}
	}
}


-- Python
nvim_lsp.pyright.setup {
	capabilities = capabilities,
	filetypes = { "python" },
	cmd = { 'pyright-langserver', '--stdio' },
}


-- Lua
nvim_lsp.lua_ls.setup {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
			}
		}
	}
}


-- Flutter
flutter_tools.setup {
	lsp = {
		capabilities = capabilities,
		settings = { enableSnippets = true }
	}
}


-- Java
nvim_lsp.jdtls.setup {
	capabilities = capabilities,
}


-- Kotlin
nvim_lsp.kotlin_language_server.setup {
	capabilities = capabilities,
	-- root_dir = nvim_lsp.util.root_pattern('*.kt'),
}


-- Swift
nvim_lsp.sourcekit.setup {
	capabilities = capabilities,
	filetypes = { "swift" },
	root_dir = nvim_lsp.util.root_pattern('*.swift'),
}


-- C/C++
nvim_lsp.clangd.setup {
	capabilities = capabilities,
}


-- CMake
nvim_lsp.cmake.setup {
	capabilities = capabilities,
}


-- Apply icons
local signs = { Error = '󰅙 ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end


vim.diagnostic.config({
	virtual_text = {
		prefix = "  ",
	},
	signs = true,
	update_in_insert = false, -- Good for performance
	underline = true,
	float = {
		header = "",
		border = 'rounded',
		focusable = true,
	}
})
