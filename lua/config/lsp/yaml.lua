local mt = {}

function mt.init(cfg)
	require'lspconfig'.yamlls.setup {
		filtypes = { 'yaml', 'yml', 'aml.docker-compose'},
		capabilities = cfg.capabilities,
		on_attach = cfg.on_attach,
	}
end

return mt
