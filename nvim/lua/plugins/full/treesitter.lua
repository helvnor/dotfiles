return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local configs = require("nvim-treesitter.configs")
		local servers = require("config.servers")
		configs.setup({
			ensure_installed = servers.parsers,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			fold = { enable = true },
		})
	end,
}
