local autocmd = vim.api.nvim_create_autocmd
local myGroup = vim.api.nvim_create_augroup("MyGroup", { clear = true })

autocmd("User", {
	pattern = "LazyDone",
	group = myGroup,
	callback = function()
		local currentPath = vim.fn.getcwd()
		local luarcPath = currentPath .. "/.cwd.lua"
		-- print("luafile = " .. luarcPath)
		pcall(function()
			dofile(luarcPath)
		end)
	end,
})
