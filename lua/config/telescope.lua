local vim = vim
local ts = require('telescope')
local utils = require('telescope.utils')
local noremap_n_slient = { noremap = true, silent = true }


require("project_nvim").setup({
	patterns = {
		".git",
		-- "_darcs",
		-- ".hg",
		-- ".bzr",
		-- ".svn",
		"Makefile",
		"package.json",
		"*.sln",
		"go.mod",
	}
})


ts.setup({
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown {
			}
		}
	}
})

ts.load_extension('projects')
ts.load_extension('ui-select')
ts.load_extension('file_browser')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fh', builtin.help_tags, noremap_n_slient)
vim.keymap.set('n', '<leader>ff', builtin.find_files, noremap_n_slient)
vim.keymap.set('n', '<C-f>', builtin.live_grep, noremap_n_slient)
vim.keymap.set('n', '<C-b>', builtin.buffers, noremap_n_slient)
vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope oldfiles<CR>', noremap_n_slient)
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", noremap_n_slient)
vim.api.nvim_set_keymap("n", "<A-p>", ":Telescope file_browser<CR>", noremap_n_slient)
