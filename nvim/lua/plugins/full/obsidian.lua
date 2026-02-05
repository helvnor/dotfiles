return {
	"epwalsh/obsidian.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "main",
				path = "~/Obsidian/main",
			},
		},
		ui = {
			enable = true,
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["/"] = { char = "󰡖", hl_group = "ObsidianRefersTo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				["-"] = { char = "󰅖", hl_group = "ObsidianCancelled" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["<"] = { char = "", hl_group = "ObsidianLeftArrow" },

				-- Extras
				["?"] = { char = "󰋗", hl_group = "ObsidianQuestion" },
				["!"] = { char = "󰀦", hl_group = "ObsidianImportant" },
				["*"] = { char = "󰓎", hl_group = "ObsidianStar" },
				['"'] = { char = "", hl_group = "ObsidianQuote" },
				["l"] = { char = "", hl_group = "ObsidianLocation" },
				["b"] = { char = "󰃀", hl_group = "ObsidianBookmark" },
				["i"] = { char = "", hl_group = "ObsidianInfo" },
				["S"] = { char = "", hl_group = "ObsidianSavings" },
				["I"] = { char = "", hl_group = "ObsidianIdea" },
				["p"] = { char = "", hl_group = "ObsidianProp" },
				["c"] = { char = "", hl_group = "ObsidianCon" },
				["f"] = { char = "󰈸", hl_group = "ObsidianFire" },
				["k"] = { char = "󰌆", hl_group = "ObsidianKey" },
				["w"] = { char = "", hl_group = "ObsidianWin" },
				["u"] = { char = "󰔵", hl_group = "ObsidianUp" },
				["d"] = { char = "󰔳", hl_group = "ObsidianDown" },
			},
		},

		mappings = {
			["<cr>"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { buffer = true, expr = true },
			},
		},
		templates = {
			folder = "template",
		},
		daily_notes = {
			folder = "daily",
			template = "daily.md",
			default_tags = {},
		},
		notes_subdir = "quick",
		note_id_func = function()
			return tostring(os.time())
		end,

		preferred_link_style = "wiki",
		wiki_link_func = "prepend_note_id",
		follow_url_func = function(url)
			vim.ui.open(url)
		end,
	},
	config = function(_, opts)
		require("obsidian").setup(opts)
		local hl = vim.api.nvim_set_hl

		hl(0, "ObsidianTodo", { fg = "#cdd6f4" }) -- Text (Off-white)
		hl(0, "ObsidianRefersTo", { fg = "#94e2d5" }) -- Teal
		hl(0, "ObsidianDone", { fg = "#a6e3a1" }) -- Green (Matches checkbox)
		hl(0, "ObsidianCancelled", { fg = "#45475a" })
		hl(0, "ObsidianRightArrow", { fg = "#89b4fa" }) -- Blue
		hl(0, "ObsidianLeftArrow", { fg = "#cba6f7" }) -- Mauve (Purple)

		-- Extras
		hl(0, "ObsidianQuestion", { fg = "#89dceb" }) -- Sky
		hl(0, "ObsidianImportant", { fg = "#fab387" }) -- Peach
		hl(0, "ObsidianStar", { fg = "#f9e2af" }) -- Yellow
		hl(0, "ObsidianQuote", { fg = "#a6e3a1" }) -- Green
		hl(0, "ObsidianLocation", { fg = "#f38ba8" }) -- Red
		hl(0, "ObsidianBookmark", { fg = "#fab387" }) -- Peach
		hl(0, "ObsidianInfo", { fg = "#89dceb" }) -- Sky
		hl(0, "ObsidianSavings", { fg = "#a6e3a1" }) -- Green
		hl(0, "ObsidianIdea", { fg = "#f9e2af" }) -- Yellow
		hl(0, "ObsidianProp", { fg = "#a6e3a1" }) -- Green
		hl(0, "ObsidianCon", { fg = "#fab387" }) -- Peach
		hl(0, "ObsidianFire", { fg = "#eba0ac" }) -- Flamingo (Soft Red)
		hl(0, "ObsidianKey", { fg = "#f9e2af" }) -- Yellow
		hl(0, "ObsidianWin", { fg = "#cba6f7" }) -- Mauve (Purple)
		hl(0, "ObsidianUp", { fg = "#a6e3a1" }) -- Green
		hl(0, "ObsidianDown", { fg = "#f38ba8" }) -- Red
	end,
}
