return {
	{
		"sainnhe/everforest",
		name = "everforest",
		priority = 1000,
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_disable_italic_comment = 0
			vim.g.everforest_enable_bold = 1
			vim.g.everforest_current_word = "bold"
			vim.g.everforest_better_performance = 1
			vim.g.everforest_float_style = "dim"
			vim.g.everforest_transparent_background = 2
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "auto",
				dark_variant = "main",
				-- disable_background = true,
				-- disable_float_background = true,
				-- dim_inactive_windows = true,
			})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				-- transparent = false,
				-- dimInactive = true,
				theme = "wave",
				background = {
					dark = "wave",
					light = "lotus",
				},
			})
		end,
	},
}
