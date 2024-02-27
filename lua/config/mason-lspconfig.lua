local mason_lspcfg = require('mason-lspconfig')

mason_lspcfg.setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
	}
})

local lspcfg = require('lspconfig')

mason_lspcfg.setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup{}
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["lua_ls"] = function ()
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
    }
  -- }
  -- end,
  -- ["clangd"] = function ()
  --   lspconfig.clangd.setup {
  --     cmd = {
  --       "clangd",
  --       "--header-insertion=never",
  --       "--query-driver=/opt/homebrew/opt/llvm/bin/clang",
  --       "--all-scopes-completion",
  --       "--completion-style=detailed",
  --     }
  --   }
  -- end
})
