require("custom.commands")
-- require "custom.autocmds"

local opt = vim.opt
opt.title = true

if vim.g.neovide then
	vim.o.guifont = "JetbrainsMono Nerd Font:h10"

	vim.g.neovide_refresh_rate = 75

	vim.g.neovide_cursor_vfx_mode = "railgun"

	vim.keymap.set("i", "<c-s-v>", "<c-r>+")
	vim.keymap.set("i", "<c-r>", "<c-s-v>")
end

vim.filetype.add({
	filename = {
		["Appfile"] = "ruby",
		["Podfile"] = "ruby",
		["Pluginfile"] = "ruby",
		["env.sample"] = "bash",
	},
	pattern = {
		[".*Fastfile"] = "ruby",
		["Jenkinsfile.*"] = "groovy",
		[".envrc.*"] = "bash",
		["Dockerfile.*"] = "dockerfile",
		[".*appiumsession.*"] = "json",
	},
})

vim.g.loaded_ruby_provider = nil
-- vim.g.ruby_host_prog = os.getenv("GEM_HOME") .. "/bin/neovim-ruby-host"

vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.python_host_prog = "~/.pyenv/versions/2.7.18/bin/python"
vim.g.wordmotion_prefix = "<Leader>"
vim.g.coc_global_extensions = { "coc-flutter" }
vim.opt.shell = "zsh"

vim.g.clipboard = {
	name = "lemonade",
	copy = {
		["+"] = { "lemonade", "copy", "--host=127.0.0.1" },
		["*"] = { "lemonade", "copy", "--host=127.0.0.1" },
	},
	paste = {
		["+"] = { "lemonade", "paste", "--host=127.0.0.1" },
		["*"] = { "lemonade", "paste", "--host=127.0.0.1" },
	},
	cache_enabled = false,
}

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"
vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_default_query = 'select * from "{table}" limit 10'

local all_dbs = os.getenv("DBS_URL")
if all_dbs and all_dbs ~= "" then
	vim.g.dbs = vim.json.decode(all_dbs)
end

local db_ui_save_location = os.getenv("DB_UI_SAVE_LOCATION")
if db_ui_save_location and db_ui_save_location ~= "" then
	-- vim.g.db_ui_save_location = db_ui_save_location
end
