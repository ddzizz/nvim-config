local mt = {}
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local pid = vim.fn.getpid()
-- local omnisharp_bin = "C:/Users/DingDing/scoop/apps/omnisharp/current/omnisharp.exe"

function mt.init(cfg)
	-- lspconfig.omnisharp.setup {
	-- 	cmd = { "omnisharp.exe" , "--languageserver","--hostPID", tostring(pid) },
	-- 	-- cmd = { "mono", omnisharp_bin, "--languageserver","--hostPID", tostring(pid) },
	--
	-- 	root_dir = function(fname)
	-- 		return lspconfig.util.root_pattern '*.sln'(fname) or lspconfig.util.root_pattern '*.csproj'(fname)
	-- 	end,
	--
	-- 	-- configs form lsp
	-- 	capabilities = cfg.capabilities,
	-- 	on_attach = function(client, bufnr)
	-- 		client.server_capabilities.semanticTokensProvider = nil
	-- 		cfg.on_attach(client, bufnr)
	-- 	end
	-- }
	lspconfig.csharp_ls.setup {
		handlers = {
			["textDocument/definition"] = require('csharpls_extended').handler,
		},
		cmd = { 'csharp-ls' },
		root_dir = function(startpath)
			return lspconfig.util.root_pattern("*.sln")(startpath)
				or lspconfig.util.root_pattern("*.csproj")(startpath)
				or lspconfig.util.root_pattern(".git")(startpath)
		end,
		filetypes = { 'cs' },
		init_options = {
			AutomaticWorkspaceInit = true,
		},

		-- configs form lsp
		capabilities = cfg.capabilities,
		on_attach = function(client, bufnr)
			client.server_capabilities.semanticTokensProvider = nil
			cfg.on_attach(client, bufnr)
		end
	}
end

return mt
