-- overriding default plugin configs!

local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"html",
		"css",
		"javascript",
		"json",
		"toml",
		"markdown",
		"c",
		"bash",
		"lua",
		"tsx",
		"typescript",
		"kotlin",
		"python",
		"java",
		"ruby",
		"yaml",
		"dockerfile",
		"sql",
		"swift",
	},
}

M.nvimtree = {
	filters = {
		dotfiles = true,
		custom = { "node_modules" },
	},

	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",
		-- "emmet-ls",
		"json-lsp",
		"tailwindcss-language-server",

		-- shell
		"shfmt",
		"shellcheck",
		"bash-language-server",

		"clangd",
		"clang-format",

		-- python
		"pyright",
		-- xml
		"lemminx",

		-- ruby
		"rubocop",
		"solargraph",

		-- python
		"pyright",
		"autopep8",
		"debugpy",
		-- markdown
		"marksman",
		-- yaml
		"yaml-language-server",
		"yamlfmt",
		"yamllint",
		-- kotlin
		-- "kotlin-language-server"
	},
}

return M
