return {
	"petertriho/nvim-scrollbar",
	enabled = true,
	event = "BufReadPost",
	opts = {
		handlers = {
			gitsigns = true,
		},
		priority = 100,
	},
}
