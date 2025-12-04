return {
	"neovim/nvim-lspconfig",
	enabled = true,
	event = "VeryLazy",
	config = function()
		local servers = require("config.servers")
		for _, server in ipairs(servers.lsp) do
			vim.lsp.enable(server)
		end
	end,
}
