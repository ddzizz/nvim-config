local mt = {}

function mt.init(cfg)
	require'lspconfig'.gopls.setup {
		on_attach = cfg.on_attach,
	}
end

return mt

