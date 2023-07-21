local null_ls = require("null-ls")

local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local extensions = {
	javascript = "js",
	javascriptreact = "jsx",
	json = "json",
	jsonc = "jsonc",
	markdown = "md",
	typescript = "ts",
	typescriptreact = "tsx",
}

local FORMATTING = methods.internal.FORMATTING
local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING

local sources = {

	-- webdev stuff
	format.deno_fmt.with({
		method = FORMATTING,
		generator_opts = {
			command = "deno",
			args = function(params)
				return { "fmt", "-", "--line-width", "120", "--ext", extensions[params.ft] }
			end,
			to_stdin = true,
		},
		factory = h.formatter_factory,
		filetypes = {
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"markdown",
			"typescript",
			"typescriptreact",
		},
	}),
	-- b.formatting.prettier,
	format.prettier.with({ filetypes = { "html", "markdown", "css" } }),

	-- Lua
	format.stylua,

	-- Shell
	format.shfmt.with({ filetypes = { "bash" } }),
	-- lint.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- cpp
	format.clang_format,
	-- python
	format.autopep8.with({
		filetypes = { "python" },
		method = { FORMATTING, RANGE_FORMATTING },
		generator_opts = {
			command = "autopep8",
			args = h.range_formatting_args_factory({
				"-",
				"--max-line-length",
				"120",
			}, "--line-range", nil, { use_rows = true }),
			to_stdin = true,
		},
	}),
	-- ruby
	format.rubocop,
	-- xml
	format.xmllint,
	-- yaml
	-- b.diagnostics.yamllint,
	format.yamlfmt,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
