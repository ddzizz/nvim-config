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
		use 'vim-autoformat/vim-autoformat'
		use 'rstacruz/vim-closer'

		-- Load on an autocommand event
		use {'andymass/vim-matchup', event = 'VimEnter'}

		-- 图标
		use 'nvim-tree/nvim-web-devicons'

		-- 启动屏
		use {
			'glepnir/dashboard-nvim',
			requires = {'nvim-tree/nvim-web-devicons'},
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
		use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

		-- Buffer栏
		use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

		-- 文件树
		use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }

		-- 文件查找
		use { 'nvim-lua/plenary.nvim'}
		use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} } }

		-- 编码辅助
		use { 'mg979/vim-visual-multi', branch = 'master' }
		use 'mbbill/undotree'
		use 'liuchengxu/vista.vim'
		use 'brooth/far.vim'

		-- 代码补全
		-- LSP
		use {
			'neovim/nvim-lspconfig',
			config = function()
				require('config.nvim-lspconfig')
			end,
		}

		-- Autocompletion
		use {'hrsh7th/cmp-nvim-lsp'}
		use {'hrsh7th/cmp-buffer'}
		use {'hrsh7th/cmp-path'}
		use {'hrsh7th/cmp-cmdline'}
		use {
			'hrsh7th/nvim-cmp',
			config = function()
				require('config.nvim-cmp')
			end,
		}

		-- For golang

		-- For lua
		use {'saadparwaiz1/cmp_luasnip'}
		use {'hrsh7th/cmp-nvim-lua'}
		use {
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v1.x',
			requires = {
				-- LSP Support
				{'neovim/nvim-lspconfig'},             -- Required
				{'williamboman/mason.nvim'},           -- Optional
				{'williamboman/mason-lspconfig.nvim'}, -- Optional

				-- Autocompletion
				{'hrsh7th/nvim-cmp'},         -- Required
				{'hrsh7th/cmp-nvim-lsp'},     -- Required
				{'hrsh7th/cmp-buffer'},       -- Optional
				{'hrsh7th/cmp-path'},         -- Optional
				{'saadparwaiz1/cmp_luasnip'}, -- Optional
				{'hrsh7th/cmp-nvim-lua'},     -- Optional

				-- Snippets
				{'L3MON4D3/LuaSnip'},             -- Required
				{'rafamadriz/friendly-snippets'}, -- Optional
			}
		}

		-- 主题
		use "olimorris/onedarkpro.nvim"
	end
)


