return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	enabled = true,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup({})
		-- `main` branch ignores `ensure_installed`; install parsers explicitly (async, no-op if present).
		ts.install(require("config.servers").parsers)

		-- `main` branch does not start highlighting automatically.
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
			callback = function(ev)
				pcall(vim.treesitter.start, ev.buf)
			end,
		})
		pcall(vim.treesitter.start) -- buffer that triggered loading already passed FileType
	end,
}
