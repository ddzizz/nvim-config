local vim = vim
local noremap_n_slient = { noremap = true, silent = true }

require("nvim-tree").setup({
	view = {
		width = 40,
		float = {
			enable = true,
			open_win_config = {
				width = 40,
				height = 40,
			},
		},
	},
	git = {
		enable = true,
	},
	filters = {
		git_ignored = true,
	},
	-- sync_root_with_cwd = true,
	-- respect_buf_cwd = true,
	-- actions = {
	-- 	open_file = {
	-- 		quit_on_open = true,
	-- 	}
	-- },
	-- update_focused_file = {
	-- 	enable = true,
	-- 	update_root = true,
	-- },
})


-- vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFocus<CR>", noremap_n_slient)
-- vim.api.nvim_set_keymap("n", "<C-t>", ":NvimTreeToggle<CR>", noremap_n_slient)
vim.api.nvim_set_keymap("n", "<C-t>", ":NvimTreeFindFile<CR>", noremap_n_slient)

local function open_nvim_tree(data)
	-- buffer is a real file on the disk
	local real_file = vim.fn.filereadable(data.file) == 1

	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	if real_file then
		return
	end

	local api = require("nvim-tree.api")
	if directory then
		vim.cmd.cd(data.file)

		-- open the tree
		api.tree.open()
	end

	--[[
	if no_name then
		-- open the tree, find the file but don't focus it
		api.tree.toggle({ focus = false, find_file = true, })
	end
	]]
end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
