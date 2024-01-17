local mt = {}
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

function mt.init(cfg)
	require'lspconfig'.serve_d.setup {
		cmd = { 'serve-d' },
		filtypes = { 'd' },
		root_dir = function(startpath)
			return lspconfig.util.root_pattern("dub.json", "dub.sdl", ".git")(startpath)
		end,
		capabilities = cfg.capabilities,
		on_attach = cfg.on_attach,
	}
end

return mt

