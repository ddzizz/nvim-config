local vim = vim
local saga = require("lspsaga")
local keymap = vim.keymap.set
local noremap_n_slient = { noremap = true, silent = true }

saga.setup({})

keymap("n", "gh", "<cmd>Lspsaga hover_doc<CR>", noremap_n_slient)
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", noremap_n_slient)
keymap("n", "gD", "<cmd>Lspsaga peek_type_definition<CR>", noremap_n_slient)
-- keymap("n", "gr", "<cmd>Lspsaga rename<CR>", noremap_n_slient)
-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", noremap_n_slient)

-- Show cursor diagnostics
-- Like show_line_diagnostics, it supports passing the ++unfocus argument
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", noremap_n_slient)

-- Show buffer diagnostics
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", noremap_n_slient)

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", noremap_n_slient)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", noremap_n_slient)

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, noremap_n_slient)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, noremap_n_slient)

-- Toggle outline
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>", noremap_n_slient)

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", noremap_n_slient)
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", noremap_n_slient)

-- Floating terminal
keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", noremap_n_slient)
