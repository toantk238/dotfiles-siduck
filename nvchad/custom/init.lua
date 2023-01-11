require("custom.commands")
require("custom.autocmds")

vim.filetype.add({
	filename = {
		[".mkshrc"] = "sh",
		["Appfile"] = "ruby",
	},
	pattern = {
		[".*Fastfile"] = "ruby",
		["Pluginfile"] = "ruby",
		["Jenkinsfile.*"] = "groovy",
		[".envrc.*"] = "bash",
	},
})

vim.g.loaded_ruby_provider = nil
vim.g.ruby_host_prog = os.getenv("GEM_HOME") + "/bin/neovim-ruby-host"

vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.python_host_prog = "~/.pyenv/versions/2.7.18/bin/python"
