local M = {}

M.general = {
	n = {
		[";"] = { ":", "command mode", opts = { nowait = true } },
		["<leader>me"] = { ":%bd|e#<CR>", "Close all but this buffer" },
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
		["<leader>lg"] = { ":LazyGit <CR>", "Open LazyGit" },
		["<leader>lz"] = { ":Neogit <CR>", "Open Neogit" },
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
	},
}

M.lsp = {
	n = {
		["<leader>lr"] = {
			"<cmd>LspRestart<CR>",
			"Restart LSP",
		},
		["<leader>fi"] = {
			function()
				local params = vim.lsp.util.make_range_params()
				params.context = { only = { "source.organizeImports" } }
				local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 500)
				for _, res in pairs(result or {}) do
					for _, r in pairs(res.result or {}) do
						if r.edit then
							vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
						else
							vim.lsp.buf.execute_command(r.command)
						end
					end
				end
			end,
			"Lsp organize imports",
		},
	},
}

return M
