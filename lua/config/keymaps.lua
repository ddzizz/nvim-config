-- local function is_netrw()
--   return vim.bo.filetype == 'netrw'
-- end
--
-- local function wipe_netrw()
--   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--     if vim.api.nvim_buf_get_option(buf, 'filetype') == 'netrw' then
--       vim.api.nvim_buf_delete(buf, { force = true })
--     end
--   end
-- end
--
-- local function toggle_netrw()
--   if is_netrw() then     -- 当前窗口就是 netrw
--     wipe_netrw()
--   else                   -- 当前窗口不是 netrw
--     wipe_netrw()         -- 先清掉任何残留的 netrw
--     vim.cmd 'Lex'        -- 再在当前窗口打开
--   end
-- end

function init_keymaps()
	local wk = require('which-key')
	wk.add({
		-- 帮助
		{ "<F1>", "<Cmd>lua require'fzf-lua'.help_tags()<CR>", desc = "Open help tags"  },

		-- 文件
		{ "<leader>f", group = "File" },
		{ "<leader>fb", "<Cmd>lua require'fzf-lua'.buffers()<CR>", desc = "Open buffers" },
		{ "<leader>fk", "<Cmd>lua require'fzf-lua'.builtin()<CR>", desc = "Open builtin" },
		{ "<leader>ff", "<Cmd>lua require'fzf-lua'.files()<CR>", desc = "Open files" },
		{ "<leader>fm", "<Cmd>lua require'fzf-lua'.marks()<CR>", desc = "Open marks" },

		-- 查找
		{ "<leader>s", group = "Search" },
		{ "<leader>sr", "<Cmd>lua require'fzf-lua'.live_grep()<CR>", desc = "Live grep current project" },
		{ "<leader>sp", "<Cmd>lua require'fzf-lua'.grep_project()<CR>", desc = "Search all project lines" },
		{ "<leader>sf", "<Cmd>lua require'fzf-lua'.grep_visual()<CR>", desc = "Search visual selection" },

		-- 文件浏览器
		{'<C-\\>', "<CMD>Oil<CR>", desc = "Open oil explorer", { silent = true }},

		-- LazyGit
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	})
end

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		init_keymaps()
	end,
})

