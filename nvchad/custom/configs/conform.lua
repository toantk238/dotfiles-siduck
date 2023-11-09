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
	},
}

require("conform").formatters.autopep8 = {
	prepend_args = { "--max-line-length", "140" },
}

local ktlint_config_file = vim.fn.stdpath("config") .. "/config/kotlin/.editorconfig"

require("conform").formatters.ktlint = {
	prepend_args = { "--editorconfig=" .. ktlint_config_file },
}

require("conform").formatters.prettier = {
	prepend_args = { "--print-width", "120" },
}

require("conform").formatters.xmlformat = {
	prepend_args = { "--selfclose", "--blanks", "--indent", "4" },
}

require("conform").setup(options)
