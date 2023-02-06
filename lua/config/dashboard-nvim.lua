local vim = vim
local noremap_n_slient = { noremap = true, silent = true }

local time = os.date("%H:%M")
local v = vim.version()
local version = time .. "  v" .. v.major .. "." .. v.minor .. "." .. v.patch

local db = require('dashboard')
db.setup({
	theme = 'hyper',
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
		}
	}
})

