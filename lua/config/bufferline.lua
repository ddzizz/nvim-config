local vim = vim
local noremap_n_slient = { noremap = true, silent = true }

require("bufferline").setup({
	options = {
		-- 使用 nvim 内置lsp
		diagnostics = "nvim_lsp",
		-- 左侧让出 nvim-tree 的位置
		offsets = { {
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left"
		} },
		-- indicator = {
		-- 	style = 'underline',
		-- },
        -- separator_style = "thick",
	},
	highlights = {
		indicator_selected = {
			fg = "#FFA066",
			bg = "#FFA066",
		},
	},
})

-- bufferline 左右Tab切换
vim.api.nvim_set_keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", noremap_n_slient)
vim.api.nvim_set_keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", noremap_n_slient)
vim.api.nvim_set_keymap('n', '<leader>bl', ":BufferLineCloseLeft<CR>", noremap_n_slient)
vim.api.nvim_set_keymap('n', '<leader>bh', ":BufferLineCloseRight<CR>", noremap_n_slient)
vim.api.nvim_set_keymap('n', '<leader>bc', ":BufferLinePickClose<CR>", noremap_n_slient)
vim.api.nvim_set_keymap('n', '<leader>bp', ":BufferLinePick<CR>", noremap_n_slient)
