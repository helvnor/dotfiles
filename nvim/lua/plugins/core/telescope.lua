return {
	"nvim-telescope/telescope.nvim",
	enabled = true,
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	init = function()
		if not vim.treesitter.ft_to_lang then
			vim.treesitter.ft_to_lang = function(ft)
				return vim.treesitter.language.get_lang(ft) or ft
			end
		end
	end,
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
}
