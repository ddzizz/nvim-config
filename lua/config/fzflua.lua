local vim = vim
local fzflua = require('fzf-lua')
local noremap_n_slient = { noremap = true, silent = true }

fzflua.setup({})

-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, noremap_n_slient)
vim.keymap.set('n', '<C-p>', fzflua.files, noremap_n_slient)
vim.keymap.set({ 'v', 'n' }, '<C-f>', fzflua.grep_visual, noremap_n_slient)
vim.keymap.set({ 'v', 'n' }, '<A-f>', fzflua.live_grep, noremap_n_slient)
vim.keymap.set('n', '<C-b>', fzflua.buffers, noremap_n_slient)
-- vim.keymap.set('n', '<leader>fr', fzflua.oldfiles(), noremap_n_slient)
-- vim.keymap.set('n', 'gr', fzflua.lsp_references(), noremap_n_slient)
-- vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope oldfiles<CR>', noremap_n_slient)
-- vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", noremap_n_slient)
-- vim.api.nvim_set_keymap("n", "<A-p>", ":Telescope file_browser<CR>", noremap_n_slient)


