return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = true,
	event = { "BufReadPost", "BufNewFile" },
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		indent = {
			char = "│",
		},
		scope = {
			enabled = true,
			char = "┃",
		},
	},
}
