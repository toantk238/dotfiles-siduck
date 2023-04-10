local null_ls = require("null-ls")

local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {

	-- webdev stuff
	format.deno_fmt,
	-- b.formatting.prettier,
	format.prettier.with({ filetypes = { "html", "markdown", "css" } }),

	-- Lua
	format.stylua,

	-- Shell
	-- format.shfmt,
	-- lint.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- cpp
	format.clang_format,
	-- python
	format.autopep8,
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
