local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		sh = { "shfmt" },
		python = { "autopep8" },
		kotlin = { "ktlint" },
		java = { "google-java-format" },
		xml = { "xmlformat" },
	},
}

require("conform").formatters.autopep8 = {
	prepend_args = { "--max-line-length", "120" },
}

require("conform").formatters.prettier = {
	prepend_args = { "--print-width", "120" },
}

require("conform").formatters.xmlformat = {
	prepend_args = { "--selfclose", "--blanks", "--indent", "4" },
}

require("conform").setup(options)
