local overrides = require("custom.configs.overrides")

return {

	----------------------------------------- default plugins ------------------------------------------
	{
		"hrsh7th/nvim-cmp",
		opts = {
			sources = {
				-- trigger_characters is for unocss lsp
				{ name = "nvim_lsp", trigger_characters = { "-" } },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				-- format & linting
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},

		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	-- override default configs
	{ "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
	{ "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },
	{ "williamboman/mason.nvim", opts = overrides.mason },
	{ "nvim-telescope/telescope.nvim", opts = overrides.telescope },

	--------------------------------------------- custom plugins ----------------------------------------------

	{
		"karb94/neoscroll.nvim",
		keys = { "<C-d>", "<C-u>" },
		config = function()
			require("neoscroll").setup()
		end,
	},

	-- autoclose tags in html, jsx only
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- get highlight group under cursor
	{
		"nvim-treesitter/playground",
		cmd = "TSCaptureUnderCursor",
		config = function()
			require("nvim-treesitter.configs").setup()
		end,
	},

	-- dim inactive windows
	{
		"andreadev-it/shade.nvim",
		keys = "<Bslash>",
		config = function()
			require("shade").setup({
				exclude_filetypes = { "NvimTree" },
			})
		end,
	},

	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		config = function()
			require("trouble").setup()
		end,
	},

	{
		"elkowar/yuck.vim",
		config = function()
			vim.opt.ft = "yuck"
		end,
	},

	-- Lua
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		config = function()
			require("custom.configs.zenmode")
		end,
	},
	{
		"preservim/tagbar",
		cmd = "TagbarToggle",
	},

	{
		"mfussenegger/nvim-dap",
		ft = { "python" },
		lazy = true,
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				-- after = "nvim-dap",
				config = function()
					require("custom.configs.nvim-dap-ui")
				end,
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				-- after = "nvim-dap",
				config = function()
					local dap_virtual_text = require("nvim-dap-virtual-text")
					dap_virtual_text.setup({
						commented = true,
					})
				end,
			},

			{
				"mfussenegger/nvim-dap-python",
				-- after = "nvim-dap",
				config = function()
					require("custom.configs.nvim-dap-python")
				end,
			},
		},
	},
	{
		"akinsho/git-conflict.nvim",
		-- after = "ui",
		tag = "v1.0.0",
		config = function()
			require("git-conflict").setup()
		end,
		lazy = false,
	},

	{
		"direnv/direnv.vim",
		lazy = false,
	},

	{
		"johmsalas/text-case.nvim", -- after = "ui",
		config = function()
			-- require("textcase").setup({})
		end,
		lazy = true,
	},

	{
		"rmagatti/auto-session",
		-- after = "ui",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
				post_restore_cmds = { "NvimTreeToggle" },
			})
		end,
		lazy = false,
		-- cmd = "SessionRestore"
	},

	{
		"windwp/nvim-spectre",
		-- after = "ui",
		config = function()
			require("spectre").setup()
		end,
	},

	{
		"tpope/vim-fugitive",
		lazy = false,
	},

	{
		"chaoren/vim-wordmotion",
		lazy = false,
	},

	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		cmd = "HopWord",
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
		branch = "main",
		-- after = "ui",
	},

	{
		"axkirillov/easypick.nvim",
		lazy = false,
	},

	{
		"axkirillov/telescope-changed-files",
		config = function()
			require("telescope").load_extension("changed_files")
		end,
		lazy = false,
	},
	{
		"neoclide/coc.nvim",
		branch = "release",
		ft = { "dart" },
		lazy = true,
		dependencies = {
			{
				"dart-lang/dart-vim-plugin",
			},
			{
				"natebosch/vim-lsc",
			},
			{
				"natebosch/vim-lsc-dart",
			},
		},
		config = function()
			require("custom.configs.coc")
		end,
	},
	{
		"folke/neodev.nvim",
		ft = { "lua" },
		lazy = true,
		config = function()
			require("neodev").setup({})
			require("custom.configs.lspconfig-lua")
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
		},
		config = true,
		lazy = false,
	},
	{
		"junegunn/fzf.vim",
		dependencies = {
			"junegunn/fzf",
		},
		lazy = false,
	},
}
