local vim = vim
local noremap_n_slient = { noremap = true, silent = true }

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5  -- You can change this too

require("nvim-tree").setup({
	view = {
		relativenumber = true,
		float = {
			enable = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2)
								- vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,

		},

		width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end
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
	-- -- buffer is a real file on the disk
	-- local real_file = vim.fn.filereadable(data.file) == 1
	--
	-- -- buffer is a directory
	-- local directory = vim.fn.isdirectory(data.file) == 1
	--
	-- -- buffer is a [No Name]
	-- local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
	--
	-- if real_file then
	-- 	return
	-- end
	--
	-- local api = require("nvim-tree.api")
	-- if directory then
	-- 	vim.cmd.cd(data.file)
	--
	-- 	-- open the tree
	-- 	api.tree.open()
	-- end

	--[[
	if no_name then
		-- open the tree, find the file but don't focus it
		api.tree.toggle({ focus = false, find_file = true, })
	end
	]]
end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
