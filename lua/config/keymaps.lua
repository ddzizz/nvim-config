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
function git_commit_with_msg()
  vim.ui.input({ prompt = 'Commit message: ' }, function(msg)
    if not msg or msg == '' then return end        -- 用户取消或空内容
    vim.system({ 'git', 'commit', '-m', msg })     -- 立即提交
    vim.notify('Committed: ' .. msg, vim.log.levels.INFO)
  end)
end

function git_add_cursor_or_buffer()
  local oil_ok, oil = pcall(require, "oil")
  local path

  -- 1. 取目标路径
  if oil_ok and vim.bo.filetype == "oil" then
    local entry = oil.get_cursor_entry()
    if not entry then
      vim.schedule(function()
        vim.notify("No entry selected in oil", vim.log.levels.WARN)
      end)
      return
    end
    path = vim.fs.joinpath(oil.get_current_dir(), entry.name)
  else
    path = vim.api.nvim_buf_get_name(0)
  end

  if path == "" then
    vim.schedule(function()
      vim.notify("No file to add", vim.log.levels.WARN)
    end)
    return
  end

  -- 2. 异步执行 git add
  vim.system({ "git", "add", path }, nil, function(obj)
    local short = vim.fn.fnamemodify(path, ":.")
    vim.schedule(function()
      if obj.code == 0 then
        vim.notify("git add: " .. short, vim.log.levels.INFO)
      else
        vim.notify("git add failed: " .. table.concat(obj.stderr or {}, "\n"),
                   vim.log.levels.ERROR)
      end
    end)
  end)
end

function init_keymaps()
	local wk = require('which-key')
	wk.add({
		-- 帮助
		{ "<F1>", "<CMD>lua require'fzf-lua'.help_tags()<CR>", desc = "Open help tags"  },

		-- 文件
		{ "<leader>f", group = "File" },
		{ "<leader>fb", "<CMD>lua require'fzf-lua'.buffers()<CR>", desc = "Open buffers" },
		{ "<leader>fk", "<CMD>lua require'fzf-lua'.builtin()<CR>", desc = "Open builtin" },
		{ "<leader>ff", "<CMD>lua require'fzf-lua'.files()<CR>", desc = "Open files" },
		{ "<leader>fm", "<CMD>lua require'fzf-lua'.marks()<CR>", desc = "Open marks" },

		-- 查找
		{ "<leader>s", group = "Search" },
		{ "<leader>sr", "<CMD>lua require'fzf-lua'.live_grep()<CR>", desc = "Live grep current project" },
		{ "<leader>sp", "<CMD>lua require'fzf-lua'.grep_project()<CR>", desc = "Search all project lines" },
		{ "<leader>sf", "<CMD>lua require'fzf-lua'.grep_visual()<CR>", desc = "Search visual selection" },

		-- 文件浏览器
		{"<C-\\>", "<CMD>Oil<CR>", desc = "Open oil explorer", { silent = true }},

		-- Git
		{ "<leader>g", group = "Git" },
		{ "<leader>gs", "<CMD>!git status<CR>", desc = "Git status" },
		-- { "<leader>ga", "<CMD>!git add %<CR>", desc = "Git stage current file" },
		{ "<leader>ga", git_add_cursor_or_buffer, desc = "Git stage cursor file or oil entry" },	
		{ "<leader>gc", git_commit_with_msg, desc = "Git commit with message" },
		{ "<leader>gp", "<CMD>!git push<CR>", desc = "Git push" },

		-- LazyGit
        { "<leader>lg", "<CMD>LazyGit<cr>", desc = "LazyGit" },
	})
end

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		init_keymaps()
	end,
})

