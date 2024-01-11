require("custom.commands")
-- require "custom.autocmds"
require("custom.mycmds")

local opt = vim.opt
opt.title = true

if vim.g.neovide then
	vim.o.guifont = "JetbrainsMono Nerd Font:h14"

	vim.g.neovide_refresh_rate = 75

	vim.g.neovide_cursor_vfx_mode = "railgun"

	vim.keymap.set("i", "<c-s-v>", "<c-r>+")
	vim.keymap.set("i", "<c-r>", "<c-s-v>")
end

local filename_table = {
	["ruby"] = { "Appfile", "Podfile", "Pluginfile" },
	["bash"] = { "env.sample" },
}

local pattern_table = {
	["ruby"] = { ".*Fastfile" },
	["groovy"] = { "Jenkinsfile.*" },
	["bash"] = { ".envrc.*" },
	["dockerfile"] = { "Dockerfile.*" },
	["json"] = { ".*appiumsession.*" },
}

local function table_map_by_value(data)
	local result = {}
	for key, values in pairs(data) do
		for _, single_value in ipairs(values) do
			result[single_value] = key
		end
	end
	return result
end

vim.filetype.add({
	filename = table_map_by_value(filename_table),
	pattern = table_map_by_value(pattern_table),
	extension = {
		strings = "strings",
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

-- vim.g.db_ui_save_location = "~/Public/Workspace/StreetChat/backend_java/queries"
local db_ui_save_location = os.getenv("SQL_SAVE_LOCATION")
if db_ui_save_location and db_ui_save_location ~= "" then
	vim.g.db_ui_save_location = db_ui_save_location
end
