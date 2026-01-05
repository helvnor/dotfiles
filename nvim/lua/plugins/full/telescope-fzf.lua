return {
	"nvim-telescope/telescope-fzf-native.nvim",
	enabled = true,
	build = "make",
	config = function()
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
	end,
}
