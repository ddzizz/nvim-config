local mt = {}
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

function mt.init(cfg)
	require'lspconfig'.zls.setup {
		cmd = { 'zls' },
		filtypes = { 'zig', 'zir' },
		root_dir = function(startpath)
			return lspconfig.util.root_pattern("zls.json", "build.zig", ".git")(startpath)
		end,
		single_file_support = true,
		capabilities = cfg.capabilities,
		on_attach = cfg.on_attach,
	}
end

return mt


