local vim = vim
local ts = require('telescope')

ts.setup({
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown {
			}
		}
	}
})

ts.load_extension('project')
ts.load_extension('ui-select')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
