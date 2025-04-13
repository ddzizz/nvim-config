local vim = vim
local noremap_n_slient = { noremap = true, silent = true }

local bufferline = require("bufferline")

bufferline.setup({
	options = {
		-- 使用 nvim 内置lsp
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or ""
			return " " .. icon .. count
		end,
		indicator = {
			style = 'icon',
		},
        separator_style = { '', '' },
		style_preset = {
			bufferline.style_preset.no_italic,
		},
        -- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
		-- 左侧让出 nvim-tree 的位置
		-- offsets = { {
		-- 	filetype = "NvimTree",
		-- 	text = "File Explorer",
		-- 	highlight = "Directory",
		-- 	text_align = "left"
		-- } },
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
vim.api.nvim_set_keymap('n', '<C-w>', ":BufDel<CR>", noremap_n_slient)
vim.api.nvim_set_keymap('n', '<leader>bo', ":BufferLineCloseOthers<CR>", noremap_n_slient)
vim.api.nvim_set_keymap('n', '<leader>bl', ":BufferLineCloseLeft<CR>", noremap_n_slient)
vim.api.nvim_set_keymap('n', '<leader>bh', ":BufferLineCloseRight<CR>", noremap_n_slient)
vim.api.nvim_set_keymap('n', '<leader>bc', ":BufferLinePickClose<CR>", noremap_n_slient)
vim.api.nvim_set_keymap('n', '<leader>bp', ":BufferLinePick<CR>", noremap_n_slient)