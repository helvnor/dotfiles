return {
	"stevearc/oil.nvim",
	enabled = true,
	cmd = "Oil",
	opts = {
		delete_to_trash = true,
		watch_for_changes = false,
		view_options = {
			show_hidden = true,
		},
		float = {
			max_width = 0.5,
			max_height = 0.9,
			border = "rounded",
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
