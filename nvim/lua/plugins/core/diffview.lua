return {
	"sindrets/diffview.nvim",
	enabled = true,
	cmd = { "DiffviewOpen", "DiffviewFileHistory" },
	dependencies = "nvim-web-devicons",
	opts = {
		diff_binaries = false,
		enhanced_diff_hl = false,
		git_cmd = { "git" },
		use_icons = true,
	},
}
