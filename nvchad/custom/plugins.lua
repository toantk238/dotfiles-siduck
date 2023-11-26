local overrides = require("custom.configs.overrides")

return {

	----------------------------------------- default plugins -----------------------------------------

	{
		"gpanders/nvim-parinfer",
		event = "InsertEnter",
	},

	-- {
	--   "NvChad/ui",
	--   dir = "~/projects/ui/",
	-- },

	-- {
	--   'ein-shved/NvChad-ui',
	--   name='abc',
	--   lazy = false,
	-- },

	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,

		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				config = function(_, opts)
					-- load default luasnip config
					require("plugins.configs.others").luasnip(opts)

					local luasnip = require("luasnip")
					luasnip.filetype_extend("javascriptreact", { "html" })
					luasnip.filetype_extend("typescriptreact", { "html" })
					require("luasnip/loaders/from_vscode").lazy_load()
				end,
			},

			-- ai based completion
			-- {
			-- 	"jcdickinson/codeium.nvim",
			-- 	config = function()
			-- 		require("codeium").setup({})
			-- 	end,
			-- },
			{
				"kristijanhusak/vim-dadbod-completion",
				config = function()
					vim.api.nvim_create_autocmd("FileType", {
						pattern = { "sql", "mysql", "plsql" },
						callback = function()
							require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
						end,
					})
				end,
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"pmizio/typescript-tools.nvim",
		},

		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("custom.configs.conform")
		end,
	},

	-- override default configs
	{ "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,

		config = function(_, opts)
			dofile(vim.g.base46_cache .. "syntax")
			require("nvim-treesitter.configs").setup(opts)

			-- register mdx ft
			vim.filetype.add({
				extension = {
					mdx = "mdx",
					hurl = "hurl",
				},
			})

			vim.treesitter.language.register("markdown", "mdx")
			vim.treesitter.language.register("sql", "mysql")
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

	{
		"numToStr/Comment.nvim",
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
			local ft = require("Comment.ft")
			ft.set("mysql", "#%s")
		end,
	},

	{ "williamboman/mason.nvim", opts = overrides.mason },

	--------------------------------------------- custom plugins ----------------------------------------------
	-- smooth scroll
	{
		"karb94/neoscroll.nvim",
		keys = { "<C-d>", "<C-u>" },
		config = function()
			require("neoscroll").setup()
		end,
	},

	-- dim inactive windows
	{
		"andreadev-it/shade.nvim",
		config = function()
			require("shade").setup({
				exclude_filetypes = { "NvimTree" },
			})
		end,
	},

	-- pretty diagnostics panel
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		config = function()
			require("trouble").setup()
		end,
	},

	-- syntax support fgor yuck lang
	{
		"elkowar/yuck.vim",
		ft = "yuck",
	},

	-- distraction free mode
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		config = function()
			require("custom.configs.zenmode")
		end,
	},

	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
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
		ft = { "dart", "terraform", "tf" },
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
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
					javascript = true,
					typescript = true,
					typescriptreact = true,
					kotlin = true,
					python = true,
					java = true,
					["*"] = false,
				},
				copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v20.9.0/bin/node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},
	{
		"nangchan/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_expand_query_results = 1
		end,
	},
	{
		"toantk238/aerial.nvim",
		opts = {},
		branch = "feature/more_languages",
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("aerial").setup({
				-- optionally use on_attach to set keymaps when aerial has attached to a buffer
				on_attach = function(bufnr)
					-- Jump forwards/backwards with '{' and '}'
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
				backends = { "treesitter", "lsp", "markdown", "man" },
				filter_kind = false,
			})
			-- vim.keymap.set("n", "<leader>a", "<cmd>AerialNavToggle<CR>")
			require("telescope").load_extension("aerial")
			vim.keymap.set("n", "<leader>fc", "<cmd>:Telescope aerial<CR>")
		end,
		lazy = false,
	},
}
