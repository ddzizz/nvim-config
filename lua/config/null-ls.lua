local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
local lsp_format = require("lsp-format")

lsp_format.setup({})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.formatting.golines,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
		-- null_ls.builtins.formatting.csharpier,
		-- require("none-ls.diagnostics.eslint"),
	},
	on_attach = function(client, bufnr)
		require("lsp-format").on_attach(client, bufnr)
		-- if client.supports_method("textDocument/formatting") then
		-- 	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		-- 	vim.api.nvim_create_autocmd("BufWritePre", {
		-- 		group = augroup,
		-- 		buffer = bufnr,
		-- 		callback = function()
		-- 			vim.lsp.buf.format({ async = true })
		-- 		end,
		-- 	})
		-- end
	end,
})
