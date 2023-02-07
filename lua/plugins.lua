-- #############################################
-- ########## load all the plugins #############
-- #############################################

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



return require('packer').startup(
	function(use)
		-- Packer can manage itself
		use 'wbthomason/packer.nvim'

		-- Simple plugins can be specified as strings

		-- 操作效率
		use 'tpope/vim-surround'
		use 'junegunn/vim-easy-align'
		--use 'vim-autoformat/vim-autoformat'
		use 'rstacruz/vim-closer'

		-- Load on an autocommand event
		use { 'andymass/vim-matchup', event = 'VimEnter' }

		-- 图标
		use 'nvim-tree/nvim-web-devicons'

		-- 启动屏
		use {
			'glepnir/dashboard-nvim',
			requires = { 'nvim-tree/nvim-web-devicons' },
			event = 'VimEnter',
			config = function()
				require('config.dashboard-nvim')
			end,
		}
		--use {
		--	'goolord/alpha-nvim',
		--	requires = { 'nvim-tree/nvim-web-devicons' },
		--config = function ()
		--local alpha = require('alpha')
		--local startify = require('alpha.themes.dashboard')
		--alpha.setup(startify.config)
		--	require('config.alpha-nvim')
		--end
		--}

		-- 状态栏
		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require('config.lualine')
			end
		}

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
		use({
			'mrjones2014/legendary.nvim',
			-- sqlite is only needed if you want to use frecency sorting
			-- requires = 'kkharji/sqlite.lua'
		})

		-- 文件树
		use {
			'nvim-tree/nvim-tree.lua',
			requires = { 'nvim-tree/nvim-web-devicons' },
			config = function()
				require('config.nvim-tree')
			end
		}

		-- 文件查找
		use { 'nvim-lua/plenary.nvim' }
		use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { { 'nvim-lua/plenary.nvim' } } }

		-- 编码辅助
		use { 'mg979/vim-visual-multi', branch = 'master' }
		use 'mbbill/undotree'
		use 'liuchengxu/vista.vim'
		use 'brooth/far.vim'

		--
		use {
			'gelguy/wilder.nvim',
			config = function()
				-- config goes here
				local wilder = require('wilder')
				wilder.setup({ modes = { ':', '/', '?' } })
			end,
		}

		-- 代码补全
		-- LSP
		use {
			'neovim/nvim-lspconfig',
			config = function()
				require('config.nvim-lspconfig')
			end,
		}

		--[[
		-- DAP
		use 'mfussenegger/nvim-dap'

		-- Lint
		use 'mfussenegger/nvim-lint'

		-- Formatter
		use 'mhartington/formatter.nvim'
		]]

		-- Autocompletion
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
		use 'hrsh7th/cmp-vsnip' -- { name = 'vsnip' }
		use 'hrsh7th/vim-vsnip'
		-- 非常强大包含了大部分常用语言的代码段
		use 'rafamadriz/friendly-snippets'
		-- 是在代码提示中，显示分类的小图标支持
		use 'onsails/lspkind-nvim'

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

		-- For golang

		-- 主题
		use {
			'navarasu/onedark.nvim',
			config = function ()
				--[[
				require('onedark').setup {
					style = 'warm'
				}
				require('onedark').load()
				]]
			end
		}
		--use "olimorris/onedarkpro.nvim"
	end
)
