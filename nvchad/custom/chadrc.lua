local M = {}

M.plugins = require("custom.plugins")
--
-- M.options = {
--   nvChad = {
--     update_branch = "dev",
--   },
-- }

M.ui = {
	-- theme stuff
	theme = "monekai",
	transparency = false,
	theme_toggle = { "monekai", "everforest"  },

	hl_override = require("custom.highlights").overriden_hlgroups,
}

M.mappings = require("custom.mappings")

return M
