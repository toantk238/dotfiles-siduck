local M = {}

M.general = {
	n = {
		[";"] = { ":", "command mode", opts = { nowait = true } },
	},

	i = {
		["jk"] = { "<ESC>", "escape insert mode" },
	},
}

M.treesitter = {
	n = {
		["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "find media" },
	},
}

M.shade = {
	n = {
		["<Bslash>"] = {
			function()
				require("shade").toggle()
			end,

			"toggle shade.nvim",
		},
	},
}

M.nvterm = {
	n = {
		["<leader>gc"] = {
			function()
				require("nvterm.terminal").send("clear && g++ -o out " .. vim.fn.expand("%") .. " && ./out", "vertical")
			end,

			"compile & run a cpp file",
		},
	},
}

M.tagbar = {
	n = {
		["<F7>"] = { ":TagbarToggle <CR>", "toggle Tag Bar" },
	},
}

M.dap = {
	n = {
		["<F5>"] = { "<cmd>lua require'dap'.continue()<cr>", "Start Debug" },
		["<F8>"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		["<F12>"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		["<F9>"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		["<F3>"] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
		["<leader>du"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
		["<leader>dh"] = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
		["<leader>ep"] = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
		["<leader>de"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
	},
}

M.spectre = {
	n = {
		["<leader>s"] = { "<esc>:lua require('spectre').open_visual()<CR>", "Open Search" },
		["<leader>sw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search word" },
	},
}

M.hop = {
	n = {
		["<leader>ho"] = { ":HopWord <CR>", "HopWord" },
	},
}

M.zenmode = {
	n = {
		["<leader>ze"] = { ":ZenMode <CR>", "Toggle ZenMode" },
	},
}

M.lazygit = {
	n = {
		["<leader>lz"] = { ":LazyGit <CR>", "Open LazyGit" },
	},
}

M.telescope_changed_files = {
	n = {
		["<leader>cf"] = { ":Telescope changed_files <cr>", "Open changed files" },
	},
}

M.textcase = {
	n = {
		["gas"] = {
			"<esc>:lua require('textcase').current_word('to_snake_case')<CR>",
			"Convert current word to snake case",
		},
	}
}

return M
