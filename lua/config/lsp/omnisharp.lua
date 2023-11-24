local mt = {}
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

-- local pid = vim.fn.getpid()
-- local omnisharp_bin = "C:/Users/DingDing/scoop/apps/omnisharp/current/omnisharp.exe"

function mt.init(cfg)
	lspconfig.omnisharp.setup {
		cmd = { "C:/Softwares/Developer/omnisharp-mono/omnisharp.exe", '--languageserver', '--hostPID', tostring(vim.fn.getpid()) },
		-- root_dir = util.root_pattern("*.sln", "*.csproj"),
		-- root_dir = util.root_pattern('*.sln', '*.csproj'),
		-- filetypes = { 'cs' },
		-- use_mono = true,
		-- omnisharp = {
		-- 	useModernNet = false,
		-- },

		-- configs form lsp
		capabilities = cfg.capabilities,
		on_attach = function(client, bufnr)
			client.server_capabilities.semanticTokensProvider = nil
			cfg.on_attach(client, bufnr)
		end
	}
end

return mt
