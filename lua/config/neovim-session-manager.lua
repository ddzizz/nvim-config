local vim = vim
local sm = require('session_manager')
local smcfg = require('session_manager.config')
local noremap_n_slient = { noremap = true, silent = true }

sm.setup({
	autoload_mode = smcfg.AutoloadMode.Disabled,
	autosave_only_in_session = true,
})


vim.api.nvim_set_keymap('n', '<C-s>', ":SessionManager load_session<CR>", noremap_n_slient)
-- local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

-- vim.api.nvim_create_autocmd({ 'User' }, {
-- 	pattern = "SessionLoadPost",
-- 	group = config_group,
-- 	callback = function()
-- 		require('nvim-tree').toggle(false, true)
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
-- 	group = config_group,
-- 	callback = function()
-- 		if vim.bo.filetype ~= 'git'
-- 			and not vim.bo.filetype ~= 'gitcommit'
-- 		then sm.autosave_session() end
-- 	end
-- })
