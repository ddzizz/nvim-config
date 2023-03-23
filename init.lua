local vim = vim
local keymap = vim.keymap.set
local noremap_n_slient = { noremap = true, silent = true }

require('basic')
require('plugins')
require('theme')


keymap('n', '<leader>bo', function() vim.api.nvim_command('silent !cmd /c start "" "' .. vim.fn.expand('%:p:h') .. '"') end, noremap_n_slient)

