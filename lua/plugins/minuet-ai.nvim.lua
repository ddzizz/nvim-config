return {
	'milanglacier/minuet-ai.nvim',
	dependencies = { { "nvim-lua/plenary.nvim" } },
	opts = {
		-- 内置补全，Ctrl-E取消不是ESC
		lsp = {
			enabled_ft = { '*' },
			enabled_auto_trigger_ft = { '*' },
		},

		provider = 'openai_compatible',
		-- request_timeout = 2.5,
		-- throttle = 1500, -- Increase to reduce costs and avoid rate limits
		-- debounce = 600, -- Increase to reduce costs and avoid rate limits
		provider_options = {
			openai_compatible = {
				api_key = 'KIMI_V2_API_KEY',
				end_point = 'https://ark.cn-beijing.volces.com/api/v3/chat/completions',
				model = 'ep-20250827141525-6hp5x',
				name = 'Volcengine',
				stream = true,
				optional = {
					max_tokens = 56,
					top_p = 0.9,
					provider = {
						-- Prioritize throughput for faster completion
						sort = 'throughput',
					},
				},
			},
		},
	},

	-- config = function()
	--     require('minuet').setup {
	--         -- Your configuration options here
	--     }
	-- end,
    -- { 'nvim-lua/plenary.nvim' },
    -- optional, if you are using virtual-text frontend, nvim-cmp is not
    -- required.
    -- { 'hrsh7th/nvim-cmp' },
    -- optional, if you are using virtual-text frontend, blink is not required.
    -- { 'Saghen/blink.cmp' },
}
