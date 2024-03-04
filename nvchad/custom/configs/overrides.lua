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
		"terraform",
		"hurl",
		"rust",
		"make",
		"cmake",
		"markdown_inline",
	},
}

M.nvimtree = {
	filters = {
		dotfiles = true,
		custom = { "node_modules" },
	},
	git = {
		enable = true,
		ignore = true,
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
		-- "tsserver",
		"deno",
		"prettier",
		-- "emmet-ls",
		"json-lsp",
		-- "tailwindcss-language-server",
		"unocss-language-server",
		-- "emmet-language-server",

		-- shell
		"shfmt",
		"shellcheck",
		"bash-language-server",

		-- "clangd",
		-- "clang-format",
		-- xml
		"lemminx",
		"xmlformatter",

		-- ruby
		-- "rubocop",
		-- "solargraph",

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
		"ktlint",
		"terraform-ls",
		-- java
		"google-java-format",
		-- rust
		"rust-analyzer",
		-- cmake
		"cmake-language-server",
		-- make file
		"autotools-language-server",
		"texlab",
		"latexindent",
	},
}

M.cmp = {
	sources = {
		-- trigger_characters is for unocss lsp
		{ name = "nvim_lsp", trigger_characters = { "-" } },
		{ name = "codeium" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
	},
	experimental = {
		ghost_text = true,
	},
}

M.telescope = {
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			".git/.*",
			"Pods",
			"DerivedData",
		},
		vimgrep_arguments = {
			"rg",
			-- "--hidden",
			-- "--no-ignore",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"-g",
			"!{jquery,bootstrap,font-awesome,js}",
		},
	},
}

return M
