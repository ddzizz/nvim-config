local mason_lspcfg = require('mason-lspconfig')

mason_lspcfg.setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"bashls",
		"cssls",
		"eslint",
		"gopls",
		"html",
		"jsonls",
		"rust_analyzer",
		"svelte",
		"tailwindcss",
		"tsserver",
		"yamlls",
		"csharp_ls"
	}
})

local lspcfg = require('lspconfig')

mason_lspcfg.setup_handlers({
  function (server_name)
    lspcfg[server_name].setup{}
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["lua_ls"] = function ()
    lspcfg.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
    }
  }
  end,
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

-- vim.notify = require("noice").notify
-- vim.lsp.handlers["textDocument/hover"] = require("noice").hover
-- vim.lsp.handlers["textDocument/signatureHelp"] = require("noice").signature
