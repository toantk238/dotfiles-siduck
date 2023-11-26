local formatters = require("conform").formatters

local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "jq" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		zsh = { "shfmt" },
		python = { "autopep8" },
		kotlin = { "ktlint" },
		java = { "google-java-format" },
		xml = { "xmlformat" },
		ruby = { "rubocop" },
		yaml = { "yamlfmt" },
		dart = { "dart_format" },
		markdown = { "deno_fmt" },
	},
}

local extensions = {
	javascript = "js",
	javascriptreact = "jsx",
	json = "json",
	jsonc = "jsonc",
	markdown = "md",
	typescript = "ts",
	typescriptreact = "tsx",
}

local ktlint_config_file = vim.fn.stdpath("config") .. "/config/kotlin/.editorconfig"
local M = {
	["ktlint"] = {
		prepend_args = { "--editorconfig=" .. ktlint_config_file },
	},
	["prettier"] = {
		-- prepend_args = { "--print-width", "120" },
	},
	["xmlformat"] = {
		prepend_args = { "--selfclose", "--blanks", "--indent", "4" },
	},
	["autopep8"] = {
		prepend_args = { "--max-line-length", "140" },
	},
	["deno_fmt"] = {
		args = function(ctx)
			return {
				"fmt",
				"-",
				"--line-width",
				"140",
				"--ext",
				extensions[vim.bo[ctx.buf].filetype],
			}
		end,
	},
}

for formatter, config in pairs(M) do
	formatters[formatter] = config
end

require("conform").setup(options)
