return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			transparent = true,
			dimInactive = true,
			theme = "dragon",
			background = {
				dark = "dragon",
				light = "lotus",
			},
		})
	end,
}
