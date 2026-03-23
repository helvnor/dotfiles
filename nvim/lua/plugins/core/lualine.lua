return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "everforest",
			-- Rounded
			-- section_separators = { left = " ", right = " " },
			-- component_separators = { left = " ", right = "  " },
			-- Minimal
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = false,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},
		sections = {
			lualine_a = {
				{ "mode", padding = 1 },
				{
					function()
						local recording_register = vim.fn.reg_recording()
						if recording_register == "" then
							return ""
						else
							return "(@" .. recording_register .. ") "
						end
					end,
					padding = 0,
				},
			},
			lualine_b = { { "branch", padding = 2 }, { "diff", padding = 1 } },
			lualine_c = {
				{ "filename", path = 1 },
				{
					"diagnostics",
					sources = { "nvim_lsp" },
					padding = 1,
				},
			},
			lualine_x = { { "fileformat" }, { "filesize", padding = 0 }, { "filetype", padding = 2 } },
			lualine_y = { { "location", padding = 1 } },
			lualine_z = { { "progress", padding = 2 } },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{ "filename", path = 1 },
				{
					"diagnostics",
					sources = { "nvim_lsp" },
					padding = 1,
				},
			},
			lualine_x = { { "fileformat" }, { "filesize", padding = 0 }, { "filetype", padding = 2 } },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {
			lualine_a = {
				{
					"tabs",
					max_length = vim.o.columns,
					show_modified_status = false,
					mode = 2,
					path = 0,
					use_mode_colors = true,
				},
			},
			lualine_b = {},
			lualine_x = {
				{
					function()
						return vim.bo.modified and "unsaved changes" or " "
					end,
				},
			},
		},
		winbar = {},
		inactive_winbar = {},
		extensions = { "oil", "fzf" },
	},
}
