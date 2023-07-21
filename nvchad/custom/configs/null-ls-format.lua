local methods = require("null-ls.methods")
local h = require("null-ls.helpers")

local FORMATTING = methods.internal.FORMATTING
local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING

local extensions = {
	javascript = "js",
	javascriptreact = "jsx",
	json = "json",
	jsonc = "jsonc",
	markdown = "md",
	typescript = "ts",
	typescriptreact = "tsx",
}

local M = {}

M.autopep8 = {
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
}

M.deno_fmt = {
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
}

return M
