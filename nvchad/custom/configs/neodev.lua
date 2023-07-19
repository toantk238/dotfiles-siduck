local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
