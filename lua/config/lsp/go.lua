local vim = vim
local mt = {}

function mt.init(cfg)
	require 'lspconfig'.gopls.setup {
		capabilities = cfg.capabilities,
		on_attach = function(client, bufnr)
			cfg.on_attach(client, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set('n', '<F5>', '<cmd>!go run .<CR>', bufopts)
			vim.keymap.set('n', '<F6>', '<cmd>!go build<CR>', bufopts)
		end
	}
end

return mt
