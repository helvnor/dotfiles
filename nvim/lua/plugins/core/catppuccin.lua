return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local cmp = require("catppuccin")
		cmp.setup({
			flavour = "mocha",
			transparent_background = true,
			dim_inactive = {
				enable = true,
				shade = "dark",
				percentage = 0.2,
			},
		})
	end,
}
