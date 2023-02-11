local os = os
local tostring = tostring
local string = string
local pcall = pcall
local vim = vim
local path_ok, plenary_path = pcall(require, "plenary.path")
local session_utils = require('session_manager.utils')
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local has_project, project = pcall(require, "project_nvim")
local cdir = vim.fn.getcwd()
local shortcut_keynum = 0 
-- local if_nil = vim.F.if_nil

-- local nvim_web_devicons = {
-- 	enabled = true,
-- 	highlight = true,
-- }



local function get_extension(fn)
	local match = fn:match("^.+(%..+)$")
	local ext = ""
	if match ~= nil then
		ext = match:sub(2)
	end
	return ext
end

local function get_icon(fn)
	local nwd = require("nvim-web-devicons")
	local ext = get_extension(fn)
	return nwd.get_icon(fn, ext, { default = true })
end

local function get_shortpath(fullpath, width)
	local shortpath = string.gsub(fullpath, vim.env.HOME, "~")
	if #shortpath > width and path_ok then
		shortpath = plenary_path.new(shortpath):shorten(1, { -2, -1 })
		if #shortpath > width then
			shortpath = plenary_path.new(shortpath):shorten(1, { -1 })
		end
	end

	return shortpath
end

local function open_project(project_path)
	local success = require("project_nvim.project").set_pwd(project_path, "alpha")
	if not success then
		return
	end
	require("telescope.builtin").find_files {
		cwd = project_path,
	}
end

local function create_projects(start, target_width)
	if start == nil then
		start = 1
	end
	if target_width == nil then
		target_width = 70
	end
	if not has_project then
		return require("alpha.themes.theta").mru(start, vim.fn.getcwd())
	end
	local buttons = {}
	local project_paths = project.get_recent_projects()
	local added_projects = 0
	-- most recent project is the last
	for i = 1, #project_paths do
		if added_projects == 9 then
			break
		end
		local project_path = project_paths[i]
		local stat = vim.loop.fs_stat(project_path .. "/.git")
		if stat ~= nil and stat.type == "directory" then
			added_projects = added_projects + 1
			shortcut_keynum = shortcut_keynum + 1
			local shortcut = tostring(shortcut_keynum)
			local display_path = "  " .. get_shortpath(project_path, target_width)
			buttons[added_projects] = {
				type = "button",
				val = display_path,
				on_press = function()
					open_project(project_path)
				end,
				opts = {
					position = "center",
					shortcut = shortcut,
					cursor = target_width,
					width = target_width,
					align_shortcut = "right",
					hl_shortcut = "Keyword",
					hl = { { "Number", 1, 3 } },
					keymap = {
						"n",
						shortcut,
						"<cmd>lua require('config.alpha-nvim').open_project('" .. string.gsub(project_path, '\\', '\\\\') .. "')<CR>",
						{ noremap = true, silent = true, nowait = true },
					},
				},
			}
		end
	end
	return buttons
end

local function create_sessions(start, target_width)
	if start == nil then
		start = 1
	end
	if target_width == nil then
		target_width = 70
	end

	local sessions = session_utils.get_sessions()
	if not sessions then
		return require("alpha.themes.theta").mru(start, cdir)
	end
	local buttons = {}
	local added = 0
	shortcut_keynum = 0;
	-- most recent project is the last
	for i = 1, #sessions do
		if added == 9 then
			break
		end
		local s = sessions[i]
		added = added + 1
		shortcut_keynum = shortcut_keynum + 1
		local shortcut = tostring(shortcut_keynum)
		local display_path = '  ' .. get_shortpath(s.dir.filename, target_width)
		buttons[added] = {
			type = "button",
			val = display_path,
			on_press = function()
				session_utils.load_session(s.filename)
			end,
			opts = {
				position = "center",
				shortcut = shortcut,
				cursor = target_width,
				width = target_width,
				align_shortcut = "right",
				hl_shortcut = "Keyword",
				hl = { { "Number", 1, 3 } },
				keymap = {
					"n",
					shortcut,
					"<cmd>lua require('session_manager.utils').load_session('" .. string.gsub(s.filename, '\\', '\\\\') .. "')<CR>",
					{ noremap = true, silent = true, nowait = true },
				},
			},
		}
	end
	return buttons
end

-- local sessions = session_utils.get_sessions()
-- for k, v in pairs(sessions) do
-- 	for k1, v1 in pairs(v) do
-- 		print(k, k1, v1)
-- 	end
-- end

-- dashboard.section.header.val = {
--     "                                   ",
--     "                                   ",
--     "                                   ",
--     "                                   ",
--     " ⢸⣿⣿⣿⣿⠃⠄⢀⣴⡾⠃⠄⠄⠄⠄⠄⠈⠺⠟⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣶⣤⡀⠄ ",
--     " ⢸⣿⣿⣿⡟⢀⣴⣿⡿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⣿⣿⣿⣿⣿⣷ ",
--     " ⢸⣿⣿⠟⣴⣿⡿⡟⡼⢹⣷⢲⡶⣖⣾⣶⢄⠄⠄⠄⠄⠄⢀⣼⣿⢿⣿⣿⣿⣿⣿⣿⣿ ",
--     " ⢸⣿⢫⣾⣿⡟⣾⡸⢠⡿⢳⡿⠍⣼⣿⢏⣿⣷⢄⡀⠄⢠⣾⢻⣿⣸⣿⣿⣿⣿⣿⣿⣿ ",
--     " ⡿⣡⣿⣿⡟⡼⡁⠁⣰⠂⡾⠉⢨⣿⠃⣿⡿⠍⣾⣟⢤⣿⢇⣿⢇⣿⣿⢿⣿⣿⣿⣿⣿ ",
--     " ⣱⣿⣿⡟⡐⣰⣧⡷⣿⣴⣧⣤⣼⣯⢸⡿⠁⣰⠟⢀⣼⠏⣲⠏⢸⣿⡟⣿⣿⣿⣿⣿⣿ ",
--     " ⣿⣿⡟⠁⠄⠟⣁⠄⢡⣿⣿⣿⣿⣿⣿⣦⣼⢟⢀⡼⠃⡹⠃⡀⢸⡿⢸⣿⣿⣿⣿⣿⡟ ",
--     " ⣿⣿⠃⠄⢀⣾⠋⠓⢰⣿⣿⣿⣿⣿⣿⠿⣿⣿⣾⣅⢔⣕⡇⡇⡼⢁⣿⣿⣿⣿⣿⣿⢣ ",
--     " ⣿⡟⠄⠄⣾⣇⠷⣢⣿⣿⣿⣿⣿⣿⣿⣭⣀⡈⠙⢿⣿⣿⡇⡧⢁⣾⣿⣿⣿⣿⣿⢏⣾ ",
--     " ⣿⡇⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠇⠄⠄⢿⣿⡇⢡⣾⣿⣿⣿⣿⣿⣏⣼⣿ ",
--     " ⣿⣷⢰⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣧⣀⡄⢀⠘⡿⣰⣿⣿⣿⣿⣿⣿⠟⣼⣿⣿ ",
--     " ⢹⣿⢸⣿⣿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣉⣤⣿⢈⣼⣿⣿⣿⣿⣿⣿⠏⣾⣹⣿⣿ ",
--     " ⢸⠇⡜⣿⡟⠄⠄⠄⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣻⣿⣿⣿⣿⣿⠟⠁⢳⠃⣿⣿⣿ ",
--     " ⠄⣰⡗⠹⣿⣄⠄⠄⠄⢀⣿⣿⣿⣿⣿⣿⠟⣅⣥⣿⣿⣿⣿⠿⠋⠄⠄⣾⡌⢠⣿⡿⠃ ",
--     " ⠜⠋⢠⣷⢻⣿⣿⣶⣾⣿⣿⣿⣿⠿⣛⣥⣾⣿⠿⠟⠛⠉            ",
--     "                                   ",
--     "                                   ",
--     "    ~ brain.exist() == null; ~    ",
--     "                                   ",
--
-- }
--

-- dashboard.section.header.val = {
-- 			"                                   ",
-- 			"          ▀████▀▄▄              ▄█ ",
-- 			"            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
-- 			"    ▄        █          ▀▀▀▀▄  ▄▀  ",
-- 			"   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
-- 			"  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
-- 			"  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
-- 			"   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
-- 			"    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
-- 			"   █   █  █      ▄▄           ▄▀   ",
-- 			"                                   ",
-- }
--
local function header_hl_today()
	local wday = os.date("*t").wday
	local colors = { "Keyword", "Constant", "Number", "Type", "String", "Special", "Function" }
	return colors[wday]
end

local section_header = {
	type = "text",
	val = {
		[[                                                                       ]],
		[[  ██████   █████                   █████   █████  ███                  ]],
		[[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
		[[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
		[[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
		[[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
		[[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
		[[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
		[[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
	},
	opts = {
		position = "center",
		hl = header_hl_today(),
		-- wrap = "overflow";
	},
}

local section_projects = {
	type = "group",
	val = {
		{
			type = "text",
			val = "Projects",
			opts = {
				hl = "SpecialComment",
				shrink_margin = false,
				position = "center",
			},
		},
		{
			type = "group",
			val = create_projects,
		},
	},
}

local section_sessions = {
	type = "group",
	val = {
		{
			type = "text",
			val = "Sessions",
			opts = {
				hl = "SpecialComment",
				shrink_margin = false,
				position = "center",
			},
		},
		{
			type = "group",
			val = create_sessions,
		},
	},
}

-- Set menu
local section_shotcuts = {
	type = "group",
	val = {
		{ type = "text", val = "Menu", opts = { hl = "SpecialComment", position = "center" } },
		{ type = "padding", val = 1 },
		dashboard.button("e", "  New file", "<cmd>ene<CR>"),
		dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
		dashboard.button("r", "  Recently", "<cmd>Telescope oldfiles<CR>"),
		dashboard.button("p", "  Projects", "<cmd>Telescope projects<CR>"),
		dashboard.button("s", "  Sessions", "<cmd>SessionManager load_session<CR>"),
		-- dashboard.button("c", "  Configuration", "<cmd>e ~/AppData/Local/nvim/init.lua <CR>"),
		-- dashboard.button("u", "  Update plugins", "<cmd>PackerSync<CR>"),
		-- dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
	},
	position = "center",
}

local function get_info()
	local total_plugins = #vim.tbl_keys(_G.packer_plugins)
	local datetime = os.date(" %Y-%m-%d   %A")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
	return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
end

local section_info = {
	type = "text",
	val = get_info(),
	opts = {
		hl = "Comment",
		position = "center",
	}
}

-- dashboard.section.buttons.val = {
--     dashboard.button( "e", "  New file" , "ene <BAR> startinsert <CR>"),
--     dashboard.button( "p", "  Open Projects", "Telescope project"),
-- 	dashboard.button( "s", "  Open Session", "SessionManager load_session" ),
--     dashboard.button( "r", "  Recently opened files"   , "Telescope oldfiles<CR>"),
--     dashboard.button( "f", "  Find file", "cd $HOME/Workspace | Telescope find_files<CR>"),
-- }
-- utils.button("SPC t o", "  Recently opened files"),
-- utils.button("SPC t f", "  Find file"),
-- utils.button("SPC t l", "  Find word"),
-- utils.button("SPC t F", "  File browser"),
-- utils.button("SPC t 1", "  Find repo"),
-- utils.button("SPC t s", "  Open session"),
-- utils.button("SPC c n", "  New file"),
-- utils.button("SPC p u", "  Plugins"),
-- utils.button("q", "  Quit", "<Cmd>qa<CR>"),

local config = {
	layout = {
		section_header,
		{ type = "padding", val = 1 },
		section_shotcuts,
		{ type = "padding", val = 1 },
		section_sessions,
		{ type = "padding", val = 1 },
		section_projects,
		{ type = "padding", val = 1 },
		section_info,
	},
	opts = {
		margin = 5,
		setup = function()
			vim.cmd([[
            autocmd alpha_temp DirChanged * lua require('alpha').redraw()
            ]])
		end,
	},
}


alpha.setup(config)
-- alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
-- vim.cmd([[
--     autocmd FileType alpha setlocal nofoldenable
-- ]])
--

return {
	open_project = open_project,
}
