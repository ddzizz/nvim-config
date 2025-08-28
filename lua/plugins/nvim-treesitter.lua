return {
	"nvim-treesitter/nvim-treesitter", 
	branch = 'master', 
	lazy = false, 
	build = ":TSUpdate",
	-- opts = {
	-- 	highlight = {
	-- 		enable = true,
	-- 	},
	-- 	indent = {
	-- 		enable = true,
	-- 	}
	-- },
    config = function(_, opts)
      -- if type(opts.ensure_installed) == "table" then
      --   opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
      -- end
      require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
		})
    end,
}

