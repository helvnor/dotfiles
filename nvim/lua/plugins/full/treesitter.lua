return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	enabled = true,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local servers = require("config.servers")
		require("nvim-treesitter").setup({
			ensure_installed = servers.parsers,
		})
	end,
}
