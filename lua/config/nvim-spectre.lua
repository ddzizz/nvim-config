local vim = vim
local noremap_n_slient = { noremap = true, silent = true }

local st = require('spectre')
st.setup()

vim.api.nvim_set_keymap('n', '<leader>S', ':lua require("spectre").open()<CR>', noremap_n_slient)
vim.api.nvim_set_keymap('n', '<leader>sw', ':lua require("spectre").open_visual({select_word=true})<CR>', noremap_n_slient)
vim.api.nvim_set_keymap('v', '<leader>s', ':lua require("spectre").open_visual()<CR>', noremap_n_slient)
