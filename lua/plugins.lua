-- #############################################
-- ########## load all the plugins #############
-- #############################################

pcall(require, 'impatient')

local vim = vim
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- Check if packer exists
if not packer_exists then
	if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
		return
	end

	local directory = string.format("%s/site/pack/packer/start/", vim.fn.stdpath("data"))

	vim.fn.mkdir(directory, "p")


	local out = vim.fn.system(
		string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
	)

	print(out)
	print("Downloading packer.nvim...")

	return
end

vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

return require('packer').startup({
	function(use)
		-- Packer can manage itself
		use 'wbthomason/packer.nvim'

		-- 启动加速
		use { 'lewis6991/impatient.nvim' }

		-- vim必备,快速操作包围符号
		use 'tpope/vim-repeat'
		use 'tpope/vim-surround'

		-- 对齐
		use 'junegunn/vim-easy-align'
		--use 'vim-autoformat/vim-autoformat'

		-- 自动添加括号
		--use 'rstacruz/vim-closer'
		use {
			"windwp/nvim-autopairs",
			config = function()
				require("config.nvim-autopairs")
			end
		}

		-- 快速移动
		use {
			'ggandor/leap.nvim',
			config = function()
				require('leap').add_default_mappings()
			end
		}
		use {
			'ggandor/flit.nvim',
			config = function()
				require('flit').setup {
					keys = { f = 'f', F = 'F', t = 't', T = 'T' },
					-- A string like "nv", "nvo", "o", etc.
					labeled_modes = "v",
					multiline = true,
					-- Like `leap`s similar argument (call-specific overrides).
					-- E.g.: opts = { equivalence_classes = {} }
					opts = {}
				}
			end
		}

		-- 快速在括号之间移动
		use { 'andymass/vim-matchup', event = 'VimEnter' }

		-- 图标
		use 'nvim-tree/nvim-web-devicons'

		-- git
		--[[
		use {
			'lewis6991/gitsigns.nvim',
			config = function()
				require('config.gitsigns')
			end
		}
		]]

		-- 启动屏
		-- use {
		-- 	'glepnir/dashboard-nvim',
		-- 	requires = { 'nvim-tree/nvim-web-devicons' },
		-- 	event = 'VimEnter',
		-- 	config = function()
		-- 		require('config.dashboard-nvim')
		-- 	end,
		-- }
		use {
			'goolord/alpha-nvim',
			requires = { 'nvim-tree/nvim-web-devicons' },
			config = function()
				require('config.alpha-nvim')
			end
		}

		-- 状态栏
		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require('config.lualine')
			end
		}
		-- use({
		-- 	'glepnir/galaxyline.nvim',
		-- 	branch = 'main',
		-- 	-- your statusline
		-- 	config = function()
		-- 		require('config.galaxyline')
		-- 	end,
		-- 	-- some optional icons
		-- 	requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		-- })

		-- Buffer栏
		use {
			'akinsho/bufferline.nvim',
			tag = "v3.*",
			requires = 'nvim-tree/nvim-web-devicons',
			config = function()
				require('config.bufferline')
			end
		}

		-- 快捷键
		use {
			'folke/which-key.nvim',
			config = function()
				require("which-key").setup {
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				}
			end
		}
		-- use({
		-- 	'mrjones2014/legendary.nvim',
		-- 	-- sqlite is only needed if you want to use frecency sorting
		-- 	-- requires = 'kkharji/sqlite.lua'
		-- })
		-- 辅助库
		use { 'nvim-lua/plenary.nvim' }

		-- 文件树
		--[[ use {
			'nvim-tree/nvim-tree.lua',
			requires = { 'nvim-tree/nvim-web-devicons' },
			config = function()
				require('config.nvim-tree')
			end
		} ]]
		use {
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require('config.neo-tree')
			end
		}

		-- 注释
		use {
			'numToStr/Comment.nvim',
			config = function()
				require('config.Comment')
			end
		}

		-- Project
		-- use {
		-- 	'charludo/projectmgr.nvim',
		-- 	rocks = { 'lsqlite3complete' },
		-- }
		--
		-- Session
		use { 'Shatur/neovim-session-manager',
			config = function()
				require('config.neovim-session-manager')
			end
		}
		-- Lua
		--[[
		use {
			'rmagatti/auto-session',
			config = function()
				require("config.auto-session")
			end
		}
		]]
		-- use({
		-- 	"folke/persistence.nvim",
		-- 	event = "BufReadPre", -- this will only start session saving when an actual file was opened
		-- 	module = "persistence",
		-- 	config = function()
		-- 		require("persistence").setup()
		-- 	end,
		-- })


		-- 文件查找
		use { 'nvim-telescope/telescope-ui-select.nvim' }
		-- use { 'nvim-telescope/telescope-project.nvim' }
		--[[
		use {
			"ahmedkhalf/project.nvim",
			config = function()
				require('project_nvim').setup()
			end
		}
		]]
		use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
		--[[ use {
			"nvim-telescope/telescope-file-browser.nvim",
			requires = {
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
			}
		} ]]
		use {
			'nvim-telescope/telescope.nvim',
			tag = '0.1.1',
			requires = {
				{ 'nvim-lua/plenary.nvim' },
				{ "nvim-telescope/telescope-fzf-native.nvim", run = 'make' }
			},
			config = function()
				require('config.telescope')
			end
		}

		-- 编码辅助
		use { 'mg979/vim-visual-multi', branch = 'master' }
		use 'mbbill/undotree'

		-- 搜索和查看lsp符号，tags
		use 'liuchengxu/vista.vim'

		-- 正则搜索和替换
		-- use 'brooth/far.vim'
		use {
			'windwp/nvim-spectre',
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require('config.nvim-spectre')
			end
		}

		-- 弹窗提示
		use { 'rcarriga/nvim-notify' }

		-- nvim lua API
		use {
			"folke/neodev.nvim",
			config = function()
				require("neodev").setup({
					-- add any options here, or leave empty to use the default settings
				})
			end
		}

		-- vim命令菜单
		use {
			'gelguy/wilder.nvim',
			config = function()
				require('config.wilder')
			end,
		}

		-- LSP
		use {
			'neovim/nvim-lspconfig',
			config = function()
				require('config.nvim-lspconfig')
			end,
		}

		-- LSP美化
		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
			config = function()
				require("config.lspsaga")
			end,
			requires = {
				{ "nvim-tree/nvim-web-devicons" },
				--Please make sure you install markdown and markdown_inline parser
				{ "nvim-treesitter/nvim-treesitter" }
			}
		})

		-- DAP
		use 'mfussenegger/nvim-dap'
		use {
			'leoluz/nvim-dap-go',
			config = function()
				require('dap-go').setup()
			end
		}
		use {
			"rcarriga/nvim-dap-ui",
			requires = { "mfussenegger/nvim-dap" },
			config = function()
				require("neodev").setup({
					library = { plugins = { "nvim-dap-ui" }, types = true },
				})
			end
		}

		--[[
		-- Lint
		use 'mfussenegger/nvim-lint'

		-- Formatter
		use 'mhartington/formatter.nvim'
		]]

		-- 终端
		--[[ use { "akinsho/toggleterm.nvim", tag = '*', config = function()
			require("config.toggleterm")
		end } ]]

		-- 自动补全
		use { 'hrsh7th/cmp-nvim-lsp' }
		use { 'hrsh7th/cmp-buffer' }
		use { 'hrsh7th/cmp-path' }
		use { 'hrsh7th/cmp-cmdline' }
		use {
			'hrsh7th/nvim-cmp',
			config = function()
				require('config.nvim-cmp')
			end,
		}

		-- snippets
		-- use 'hrsh7th/cmp-vsnip' -- { name = 'vsnip' }
		-- use 'hrsh7th/vim-vsnip'
		use({
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			tag = "v<CurrentMajor>.*",
			-- install jsregexp (optional!:).
			run = "make install_jsregexp",
			config = function()
				require('luasnip.loaders.from_vscode').lazy_load()
			end
		})
		use { 'saadparwaiz1/cmp_luasnip' }

		-- 非常强大包含了大部分常用语言的代码段
		use 'rafamadriz/friendly-snippets'
		-- 是在代码提示中，显示分类的小图标支持
		use 'onsails/lspkind-nvim'

		-- 显示自动补全签名
		use {
			"ray-x/lsp_signature.nvim",
		}

		-- Highlight
		use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,
			config = function()
				require('config.nvim-treesitter')
			end
		}

		-- 高亮所有与光标所在位置的相同的单词
		use 'RRethy/vim-illuminate'


		-- 显示各种错误的详细列表
		use {
			"folke/trouble.nvim",
			requires = "nvim-tree/nvim-web-devicons",
			config = function()
				require("trouble").setup {}
			end
		}

		-- For golang

		-- 主题
		--[[
		use {
			'navarasu/onedark.nvim',
			config = function ()
				require('onedark').setup {
					style = 'warm'
				}
				require('onedark').load()
			end
		}
		]]
		use 'folke/tokyonight.nvim'
		use "olimorris/onedarkpro.nvim"
		use 'AlexvZyl/nordic.nvim'
		use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
		use { "catppuccin/nvim", as = "catppuccin" }
		use 'shaunsingh/nord.nvim'
	end,
	-- Packer设置
	config = {
		max_jobs = 8,
		display = {
			open_fn = require('packer.util').float,
		}
	}
})
