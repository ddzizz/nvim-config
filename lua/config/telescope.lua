local vim = vim
local ts = require('telescope')
local utils = require('telescope.utils')
-- local tst = require('telescope.themes')
local noremap_n_slient = { noremap = true, silent = true }


-- require("project_nvim").setup({
-- 	patterns = {
-- 		".git",
-- 		-- "_darcs",
-- 		-- ".hg",
-- 		-- ".bzr",
-- 		-- ".svn",
-- 		"Makefile",
-- 		"package.json",
-- 		"*.sln",
-- 		"go.mod",
-- 	}
-- })


ts.setup({
	extensions = {
		-- ['ui-select'] = {
		-- 	tst.get_ivy{
		-- 	}
		-- },
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = 'smart_case',
		},
	},
	defaults = {
		layout_strategy = 'vertical',
		layout_config = {
			height = 0.95,
			prompt_position = 'top',
		},
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--ignore-file',
			'.vimignore'
		}
	},

	-- pickers = {
	-- 	find_files = {
	-- 		theme = 'ivy',
	-- 	}
	-- }
})

-- ts.load_extension('projects')
ts.load_extension('ui-select')
ts.load_extension('fzf')
-- ts.load_extension('file_browser')
--

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fh', builtin.help_tags, noremap_n_slient)
vim.keymap.set('n', '<C-p>', builtin.find_files, noremap_n_slient)
vim.keymap.set({ 'v', 'n' }, '<C-f>', builtin.grep_string, noremap_n_slient)
vim.keymap.set({ 'v', 'n' }, '<A-f>', builtin.live_grep, noremap_n_slient)
vim.keymap.set('n', '<C-b>', builtin.buffers, noremap_n_slient)
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, noremap_n_slient)
vim.keymap.set('n', 'gr', builtin.lsp_references, noremap_n_slient)
-- vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope oldfiles<CR>', noremap_n_slient)
-- vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", noremap_n_slient)
-- vim.api.nvim_set_keymap("n", "<A-p>", ":Telescope file_browser<CR>", noremap_n_slient)