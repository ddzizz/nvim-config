local vim = vim
local noremap_n_slient = { noremap = true, silent = true }

local time = os.date("%H:%M")
local v = vim.version()
local version = time .. "  v" .. v.major .. "." .. v.minor .. "." .. v.patch

local db = require('dashboard')


db.setup({
	theme = 'doom',
	config = {
		header = {
			"                                   ",
			"          ▀████▀▄▄              ▄█ ",
			"            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
			"    ▄        █          ▀▀▀▀▄  ▄▀  ",
			"   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
			"  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
			"  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
			"   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
			"    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
			"   █   █  █      ▄▄           ▄▀   ",
			"                                   ",
			version,
		},

		footer = {
			"       莫道君行早，更有早行人。        ",
			"       https://github.com/ddzizz       ",
		},

		center = {
			{
				icon = "🗃️  ",
				desc = "Projects                            ",
				action = "Telescope project",
			},
			{
				-- icon = "📎  ",
				icon = "☕  ",
				desc = "Work Space                          ",
				-- action = "exe 'normal melloworld'",
				action = "Telescope xray23 list",
			},
			{
				-- icon = "📎  ",
				icon = "📺  ",
				desc = "Recently files                      ",
				action = "Telescope oldfiles",
			},
			{
				icon = "🔍️  ",
				desc = "Find file                           ",
				action = "Telescope find_files",
			},
			{
				icon = "📄  ",
				desc = "New file                           ",
				action = "DashboardNewFile",
			},
			{
				-- icon = "📑  ",
				icon = "🕹️  ",
				desc = "Edit keybindings                    ",
				action = "",
			},
			{
				icon = "📻  ",
				desc = "Edit Projects                       ",
				action = "edit ~/.local/share/nvim/project_nvim/project_history",
			},
			-- {
			--   icon = "  ",
			--   desc = "Edit .bashrc                        ",
			--   action = "edit ~/.bashrc",
			-- },
			-- {
			--   icon = "  ",
			--   desc = "Change colorscheme                  ",
			--   action = "ChangeColorScheme",
			-- },
			-- {
			--   icon = "  ",
			--   desc = "Edit init.lua                       ",
			--   action = "edit ~/.config/nvim/init.lua",
			-- },
			-- {
			--   icon = "  ",
			--   desc = "Find file                           ",
			--   action = "Telescope find_files",
			-- },
			-- {
			--   icon = "  ",
			--   desc = "Find text                           ",
			--   action = "Telescopecope live_grep",
			-- },
		}

	}
})

--[[
db.setup({
	config = {
		theme = 'doom',
		header = {
			"                                   ",
			"          ▀████▀▄▄              ▄█ ",
			"            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
			"    ▄        █          ▀▀▀▀▄  ▄▀  ",
			"   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
			"  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
			"  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
			"   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
			"    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
			"   █   █  █      ▄▄           ▄▀   ",
			"                                   ",
			version,
		},
		footer = {
			"莫道君行早，更有早行人。               ",
			"https://github.com/ddzizz              ",
		},
	}
})
]]
