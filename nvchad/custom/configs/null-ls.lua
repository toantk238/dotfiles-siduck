local null_ls = require("null-ls")

local format = null_ls.builtins.formatting

local opts_format = require("custom.configs.null-ls-format")

local sources = {

	-- webdev stuff
	format.deno_fmt.with(opts_format.deno_fmt),
	-- b.formatting.prettier,
	format.prettier.with({ filetypes = { "html", "markdown", "css" } }),

	-- Lua
	format.stylua,

	-- Shell
	format.shfmt.with({ filetypes = { "sh" } }),
	-- lint.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- cpp
	format.clang_format,
	-- python
	format.autopep8.with(opts_format.autopep8),
	-- ruby
	format.rubocop,
	-- xml
	format.xmllint,
  -- go
  format.gofmt
	-- yaml
	-- b.diagnostics.yamllint,
	-- format.yamlfmt,
}

null_ls.setup({
	debug = true,
	sources = sources,
})

local cucumber_formatter = {
	name = "cucumber_formatter",
	method = null_ls.methods.FORMATTING,
	filetypes = { "cucumber" },
	generator = null_ls.formatter({
		command = "vim-gherkin-formatter",
		args = {
			"$FILENAME",
		},
		to_stdin = true,
		from_stderr = true,
		to_temp_file = true,
	}),
}

null_ls.register(cucumber_formatter)
