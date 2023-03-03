local vim = vim
local noremap_n_slient = { noremap = true, silent = true }

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

--[[ vim.fn.sign_define("DiagnosticSignError",
	{ text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
	{ text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
	{ text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
	{ text = "", texthl = "DiagnosticSignHint" }) ]]
local function getTelescopeOpts(state, path)
	return {
		cwd = path,
		search_dirs = { path },
		attach_mappings = function(prompt_bufnr, map)
			local actions = require "telescope.actions"
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local action_state = require "telescope.actions.state"
				local selection = action_state.get_selected_entry()
				local filename = selection.filename
				if (filename == nil) then
					filename = selection[1]
				end
				-- any way to open the file without triggering auto-close event of neo-tree?
				require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
			end)
			return true
		end
	}
end

require("neo-tree").setup({
	close_if_last_window = true,
	-- window = {
	-- 	width = 30,
	-- },
	buffers = {
		follow_current_file = true,
	},
	filesystem = {
		follow_current_file = true,
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_name = {
				"node_modules"
			},
			never_show = {
				".DS_Store",
				"thumbs.db"
			},
		},
		window = {
			position = "float",
			mappings = {
				["o"] = "system_open",
				["O"] = "wt_open",
			},
		},
		-- window = {
		-- 	mappings = {
		-- 		["tf"] = "telescope_find",
		-- 		["tg"] = "telescope_grep",
		-- 	},
		-- },
		-- commands = {
		-- 	telescope_find = function(state)
		-- 		local node = state.tree:get_node()
		-- 		local path = node:get_id()
		-- 		require('telescope.builtin').find_files(getTelescopeOpts(state, path))
		-- 	end,
		-- 	telescope_grep = function(state)
		-- 		local node = state.tree:get_node()
		-- 		local path = node:get_id()
		-- 		require('telescope.builtin').live_grep(getTelescopeOpts(state, path))
		-- 	end,
		-- },
		commands = {
			system_open = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				vim.api.nvim_command('silent !cmd /c start "' .. path .. '"')
			end,
			wt_open = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				vim.api.nvim_command('silent !wt -w 0 nt -d "' .. path .. '"')
			end,
		},
	},

	event_handlers = {
		{
			event = "file_opened",
			handler = function(file_path)
				--auto close
				require("neo-tree").close_all()
				-- require("neo-tree.sources.filesystem").reset_search(state)
			end
		},
	}
})

vim.api.nvim_set_keymap("n", "<C-t>", ":Neotree float reveal_force_cwd<CR>", noremap_n_slient)
vim.api.nvim_set_keymap("n", "<C-g>", ":Neotree float git_status<CR>", noremap_n_slient)
