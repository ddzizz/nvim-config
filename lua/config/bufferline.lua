local vim = vim
local noremap_n_slient = { noremap = true, silent = true }

require("bufferline").setup()

-- bufferline 左右Tab切换
vim.api.nvim_set_keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", noremap_n_slient)
vim.api.nvim_set_keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", noremap_n_slient)
