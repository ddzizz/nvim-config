-- #############################################
-- ########## load all the plugins #############
-- #############################################

local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

if not vim.g.vscode then
	return require('lazy').setup({
		-- 启动加速
		-- { 'lewis6991/impatient.nvim' },
		-- 半透明
		{
			'xiyaowong/transparent.nvim',
			lazy = false,
		},

		-- vim必备,快速操作包围符号
		 'tpope/vim-repeat',
		 'tpope/vim-surround',

		-- 对齐
		 'junegunn/vim-easy-align',
		-- 'vim-autoformat/vim-autoformat'

		-- 自动添加括号
		-- 'rstacruz/vim-closer'
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {} -- this is equalent to setup({}) function
		},

		-- 快速移动
		{
			'ggandor/leap.nvim',
			config = function()
				require('leap').add_default_mappings()
			end
		},

		{
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
		},

		-- 快速在括号之间移动
		 { 'andymass/vim-matchup', event = 'VimEnter' },

		-- 图标
		 'nvim-tree/nvim-web-devicons',

		-- git
		--[[
		 {
			'lewis6991/gitsigns.nvim',
			config = function()
				require('config.gitsigns')
			end
		}
		]]

		-- 启动屏
		--  {
		-- 	'glepnir/dashboard-nvim',
		-- 	dependencies = { 'nvim-tree/nvim-web-devicons' },
		-- 	event = 'VimEnter',
		-- 	config = function()
		-- 		require('config.dashboard-nvim')
		-- 	end,
		-- }
		 {
			'goolord/alpha-nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' },
			config = function()
				require'alpha'.setup(require'config.alpha-nvim'.config)
			end
		},

		-- 状态栏
		 {
			'nvim-lualine/lualine.nvim',
			dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require('config.lualine')
			end
		},
		-- ({
		-- 	'glepnir/galaxyline.nvim',
		-- 	branch = 'main',
		-- 	-- your statusline
		-- 	config = function()
		-- 		require('config.galaxyline')
		-- 	end,
		-- 	-- some optional icons
		-- 	dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
		-- })

		-- Buffer栏
		 {
			'akinsho/bufferline.nvim',
			version = "*",
			dependencies = 'nvim-tree/nvim-web-devicons',
			config = function()
				require('config.bufferline')
			end
		},

		-- 快捷键
		 {
			'folke/which-key.nvim',
			config = function()
				require("which-key").setup {
					-- your configuration comes here
					-- or leave it empty to  the default settings
					-- refer to the configuration section below
				}
			end
		},
		-- ({
		-- 	'mrjones2014/legendary.nvim',
		-- 	-- sqlite is only needed if you want to  frecency sorting
		-- 	-- dependencies = 'kkharji/sqlite.lua'
		-- })
		-- 辅助库
		 { 'nvim-lua/plenary.nvim' },

		-- 文件树
		{
			'nvim-tree/nvim-tree.lua',
			version = "*",
			lazy = false,
			dependencies = { 'nvim-tree/nvim-web-devicons' },
			config = function()
				require('config.nvim-tree')
			end
		},

		--  {
		-- 	"nvim-neo-tree/neo-tree.nvim",
		-- 	branch = "v3.x",
		-- 	dependencies = {
		-- 		"nvim-lua/plenary.nvim",
		-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		-- 		"MunifTanjim/nui.nvim",
		-- 	},
		-- 	config = function()
		-- 		require('config.neo-tree')
		-- 	end
		-- },
		--
		-- 注释
		 {
			'numToStr/Comment.nvim',
			config = function()
				require('config.Comment')
			end
		},

		-- Project
		--  {
		-- 	'charludo/projectmgr.nvim',
		-- 	rocks = { 'lsqlite3complete' },
		-- }
		--
		-- Session
		 { 'Shatur/neovim-session-manager',
			config = function()
				require('config.neovim-session-manager')
			end
		},
		-- Lua
		--[[
		 {
			'rmagatti/auto-session',
			config = function()
				require("config.auto-session")
			end
		}
		]]
		-- ({
		-- 	"folke/persistence.nvim",
		-- 	event = "BufReadPre", -- this will only start session saving when an actual file was opened
		-- 	module = "persistence",
		-- 	config = function()
		-- 		require("persistence").setup()
		-- 	end,
		-- })


		-- 文件查找
		 { 'nvim-telescope/telescope-ui-select.nvim' },
		--  { 'nvim-telescope/telescope-project.nvim' }
		--[[
		 {
			"ahmedkhalf/project.nvim",
			config = function()
				require('project_nvim').setup()
			end
		}
		]]
		 { 'nvim-telescope/telescope-fzf-native.nvim', build = 'mingw32-make' },
		--[[  {
			"nvim-telescope/telescope-file-browser.nvim",
			dependencies = {
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
			}
		} ]]
		 {
			'nvim-telescope/telescope.nvim',
			tag = '0.1.3',
			dependencies = {
				{ 'nvim-lua/plenary.nvim' },
				{ "nvim-telescope/telescope-fzf-native.nvim", build = 'mingw32-make' }
			},
			config = function()
				require('config.telescope')
			end
		},

		-- 编码辅助
		 { 'mg979/vim-visual-multi', branch = 'master' },
		 'mbbill/undotree',

		-- 搜索和查看lsp符号，tags
		 'liuchengxu/vista.vim',

		-- 正则搜索和替换
		--  'brooth/far.vim'
		 {
			'windwp/nvim-spectre',
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				require('config.nvim-spectre')
			end
		},

		-- 弹窗提示
		 { 'rcarriga/nvim-notify' },

		-- nvim lua API
		 {
			"folke/neodev.nvim",
			config = function()
				require("neodev").setup({
					-- add any options here, or leave empty to  the default settings
				})
			end
		},

		-- vim命令菜单
		 {
			'gelguy/wilder.nvim',
			config = function()
				require('config.wilder')
			end,
		},

		-- LSP
		--
		 { 'Decodetalkers/csharpls-extended-lsp.nvim' },
		 {
			'neovim/nvim-lspconfig',
			config = function()
				require('config.nvim-lspconfig')
			end,
		},

		-- LSP美化
		{
			"glepnir/lspsaga.nvim",
			branch = "main",
			config = function()
				require("config.lspsaga")
			end,
			dependencies = {
				{ "nvim-tree/nvim-web-devicons" },
				--Please make sure you install markdown and markdown_inline parser
				{ "nvim-treesitter/nvim-treesitter" }
			}
		},

		-- DAP
		 'mfussenegger/nvim-dap',
		 {
			'leoluz/nvim-dap-go',
			config = function()
				require('dap-go').setup()
			end
		},
		 {
			"rcarriga/nvim-dap-ui",
			dependencies = { "mfussenegger/nvim-dap" },
			config = function()
				require("neodev").setup({
					library = { plugins = { "nvim-dap-ui" }, types = true },
				})
			end
		},

		--[[
		-- Lint
		 'mfussenegger/nvim-lint'

		-- Formatter
		 'mhartington/formatter.nvim'
		]]

		-- 终端
		{
			"akinsho/toggleterm.nvim",
			version = '*',
			config = true
		},

		-- 自动补全
		 { 'hrsh7th/cmp-nvim-lsp' },
		 { 'hrsh7th/cmp-buffer' },
		 { 'hrsh7th/cmp-path' },
		 { 'hrsh7th/cmp-cmdline' },
		 {
			'hrsh7th/nvim-cmp',
			config = function()
				require('config.nvim-cmp')
			end,
		},

		-- snippets
		'honza/vim-snippets',
		'dcampos/nvim-snippy',
		'dcampos/cmp-snippy',

		--  'hrsh7th/cmp-vsnip' -- { name = 'vsnip' }
		--  'hrsh7th/vim-vsnip'
		-- {
		-- 	"L3MON4D3/LuaSnip",
		-- 	version = "v2.*",
		-- 	-- follow latest release.
		-- 	-- tag = "v<CurrentMajor>.*",
		-- 	-- install jsregexp (optional!:).
		-- 	build = "mingw32-make install_jsregexp",
		-- },
		 -- 'saadparwaiz1/cmp_luasnip',

		-- 非常强大包含了大部分常用语言的代码段
		 'rafamadriz/friendly-snippets',
		-- 是在代码提示中，显示分类的小图标支持
		 'onsails/lspkind-nvim',

		-- 显示自动补全签名
		"ray-x/lsp_signature.nvim",

		-- Highlight
		 {
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require('config.nvim-treesitter')
			end
		},
		--
		-- 高亮所有与光标所在位置的相同的单词
		 'RRethy/vim-illuminate',


		-- 显示各种错误的详细列表
		 {
			"folke/trouble.nvim",
			requires = "nvim-tree/nvim-web-devicons",
			config = function()
				require("trouble").setup {}
			end
		},

		-- For golang

		-- 主题
		--[[
		 {
			'navarasu/onedark.nvim',
			config = function ()
				require('onedark').setup {
					style = 'warm'
				}
				require('onedark').load()
			end
		}
		]]
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			-- config = function()
			-- 	require("catppuccin").setup({
			-- 		transparent_background = true,
			-- 	})
			-- end
		},
		{
			'folke/tokyonight.nvim',
			-- config = function()
			-- 	require("tokyonight").setup({
			-- 		style = 'night',
			-- 		transparent = true,
			-- 		dim_inactive = false,
			-- 		terminal_colors = true,
			-- 		styles = {
			-- 			comments = 'NONE',
			-- 			functions = 'NONE',
			-- 			keywords = 'NONE',
			-- 			strings = 'NONE',
			-- 			variables = 'NONE',
			-- 			sidebars = 'transparent',
			-- 			floats = 'transparent'
			-- 		},
			-- 	})
			-- end
		},
		"olimorris/onedarkpro.nvim",
		'AlexvZyl/nordic.nvim',
		'projekt0n/github-nvim-theme',
		'shaunsingh/nord.nvim',
		"tiagovla/tokyodark.nvim",
	})
else
	require('lazy').setup({
		-- .重复上一次的操作
		'tpope/vim-repeat',
		-- vim必备,快速操作包围符号
		'tpope/vim-surround',

		-- 对齐
		'junegunn/vim-easy-align',

		-- 快速移动
		{
			'ggandor/leap.nvim',
			config = function()
				require('leap').add_default_mappings()
			end
		},
		{
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
		},

		-- 辅助库
		{ 'nvim-lua/plenary.nvim' },

		-- 注释
		{
			'numToStr/Comment.nvim',
			config = function()
				require('config.Comment')
			end
		},

		-- 编码辅助
		{ 'mg979/vim-visual-multi', branch = 'master' },
	})
end
