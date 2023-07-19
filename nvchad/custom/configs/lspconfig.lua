local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
	"html",
	"cssls",
	"clangd",
	"jsonls",
	"tsserver",
	"unocss",
	-- "lua_ls",
	-- "bashls",
	-- "pyright",
	"lemminx",
	-- "gradle_ls",
	"marksman",
	"yamlls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

lspconfig.solargraph.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		solargraph = {
			diagnostics = false,
		},
	},
})

lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "bash" },
})

-- lspconfig.kotlin_language_server.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
--   root_dir=lspconfig.util.root_pattern("settings.gradle", "settings.gradle.kts")
-- })

--local java_17_home = os.getenv("JAVA_17_HOME")
--if java_17_home then
--	local jdtls_path = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/jdtls"
--
--	lspconfig.jdtls.setup({
--		on_attach = on_attach,
--		capabilities = capabilities,
--		cmd = {
--			java_17_home .. "/bin/java",
--			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
--			"-Dosgi.bundles.defaultStartLevel=4",
--			"-Declipse.product=org.eclipse.jdt.ls.core.product",
--			"-Dlog.protocol=true",
--			"-Dlog.level=ALL",
--			"-Xms1g",
--			"--add-modules=ALL-SYSTEM",
--			"--add-opens",
--			"java.base/java.util=ALL-UNNAMED",
--			"--add-opens",
--			"java.base/java.lang=ALL-UNNAMED",
--			"-jar",
--			jdtls_path .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
--			"-configuration",
--			jdtls_path .. "/config_linux",
--			"-data",
--			os.getenv("HOME") .. "/.cache/my_jdtls",
--		},
--	})
--end
