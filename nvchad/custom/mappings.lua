local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
  },

  i = {
    ["jk"] = { "<ESC>", "escape vim" },
  },
}

M.truzen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "truzen ataraxis" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "truzen minimal" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "truzen focus" },
  },
}

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "find media" },
  },
}

M.shade = {
  n = {
    ["<leader>s"] = {
      function()
        require("shade").toggle()
      end,

      "toggle shade.nvim",
    },
  },
}

M.nvterm = {
  n = {
    ["<leader>cc"] = {
      function()
        require("nvterm.terminal").send("clear && g++ -o out " .. vim.fn.expand "%" .. " && ./out", "vertical")
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
    ["<F5>"] = {"<cmd>lua require'dap'.continue()<cr>", "Start Debug"},
    ["<F10>"] = {"<cmd>lua require'dap'.continue()<cr>", "Step Over"},
    ["<F11>"] = {"<cmd>lua require'dap'.step_into()<cr>", "Step Into"},
    ["<F12>"] = {"<cmd>lua require'dap'.step_out()<cr>", "Step Out"},
    ["<F9>"] = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint"},
    ["<F3>"] = {"<cmd>lua require'dap'.terminate()<cr>", "Terminate"},
    ["<leader>du"] = {"<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI"},
    ["<leader>dh"] = {"<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables"},
    ["<leader>ep"] = {"<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input"},
  }
}

return M
