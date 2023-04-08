require("custom.commands")
require("custom.autocmds")

vim.opt.title = true

-- vim.opt.guifont = { "JetBrainsMono Nerd Font", ":h9" }
-- vim.opt.guifont = { "Sarasa Mono SC Nerd", ":h8" }

-- vim.filetype.add {
--   filename = {
--     [".mkshrc"] = "sh",
--   },
-- }
--
-- vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
--   callback = function()
--     vim.t.bufs = vim.tbl_filter(function(bufnr)
--       return vim.api.nvim_buf_get_option(bufnr, "modified")
--     end, vim.t.bufs)
--   end,
-- })

-- for i = 1, 9, 1 do
--   vim.keymap.set("n", string.format("<A-%s>", i), function()
--     vim.api.nvim_set_current_buf(vim.t.bufs[i])
--   end)
-- end

vim.filetype.add({
	filename = {
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
-- vim.g.ruby_host_prog = os.getenv("GEM_HOME") .. "/bin/neovim-ruby-host"

vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.python_host_prog = "~/.pyenv/versions/2.7.18/bin/python"
