return {
	'milanglacier/minuet-ai.nvim',
	dependencies = { { "nvim-lua/plenary.nvim" } },
	opts = {
		-- virtualtext = {
		-- 	auto_trigger_ft = {},
		-- 	keymap = {
		-- 		-- accept whole completion
		-- 		accept = '<A-A>',
		-- 		-- accept one line
		-- 		accept_line = '<A-a>',
		-- 		-- accept n lines (prompts for number)
		-- 		-- e.g. "A-z 2 CR" will accept 2 lines
		-- 		accept_n_lines = '<A-z>',
		-- 		-- Cycle to prev completion item, or manually invoke completion
		-- 		prev = '<A-[>',
		-- 		-- Cycle to next completion item, or manually invoke completion
		-- 		next = '<A-]>',
		-- 		dismiss = '<A-e>',
		-- 	},
		-- },

		-- 内置补全，Ctrl-E取消不是ESC
		lsp = {
			enabled_ft = { '*' },
			enabled_auto_trigger_ft = { '*' },
		},

		provider = 'openai_compatible',
		request_timeout = 2.5,
		throttle = 1500, -- Increase to reduce costs and avoid rate limits
		debounce = 600, -- Increase to reduce costs and avoid rate limits

		-- 月之暗面
		-- provider_options = {
		-- 	openai_compatible = {
		-- 		api_key = 'MOON_V2_API_KEY',
		-- 		end_point = 'https://api.moonshot.cn/v1/chat/completions',
		-- 		model = 'kimi-k2-0711-preview',
		-- 		name = 'Moonshot',
		-- 		stream = true,
		-- 		optional = {
		-- 			max_tokens = 56,
		-- 			top_p = 0.9,
		-- 			provider = {
		-- 				-- Prioritize throughput for faster completion
		-- 				sort = 'throughput',
		-- 			},
		-- 		},
		-- 	},
		-- },
		
		-- 火山引擎
		provider_options = {
			openai_compatible = {
				api_key = 'VOLC_V2_API_KEY',
				end_point = 'https://ark.cn-beijing.volces.com/api/v3/chat/completions',
				model = 'ep-20250827141525-6hp5x',
				name = 'Volcengine',
				stream = true,
				optional = {
					max_tokens = 256,
					top_p = 0.9,
					provider = {
						-- Prioritize throughput for faster completion
						sort = 'throughput',
					},
				},
			},
		},
	},

}
