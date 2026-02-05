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
		hl(0, "ObsidianTodo", { fg = "#ebdbb2" }) -- Light Cream
		hl(0, "ObsidianDone", { fg = "#b8bb26" }) -- Green
		hl(0, "ObsidianRefersTo", { fg = "#8ec07c" }) -- Aqua
		hl(0, "ObsidianCancelled", { fg = "#928374" }) -- Grey
		hl(0, "ObsidianRightArrow", { fg = "#83a598" }) -- Blue
		hl(0, "ObsidianLeftArrow", { fg = "#d3869b" }) -- Purple
		hl(0, "ObsidianQuestion", { fg = "#8ec07c" }) -- Aqua
		hl(0, "ObsidianImportant", { fg = "#fe8019" }) -- Orange
		hl(0, "ObsidianStar", { fg = "#fabd2f" }) -- Yellow
		hl(0, "ObsidianQuote", { fg = "#b8bb26" }) -- Green
		hl(0, "ObsidianLocation", { fg = "#fb4934" }) -- Red
		hl(0, "ObsidianBookmark", { fg = "#fe8019" }) -- Orange
		hl(0, "ObsidianInfo", { fg = "#b8bb26" }) -- Green
		hl(0, "ObsidianSavings", { fg = "#b8bb26" }) -- Green
		hl(0, "ObsidianIdea", { fg = "#fabd2f" }) -- Yellow
		hl(0, "ObsidianProp", { fg = "#b8bb26" }) -- Green
		hl(0, "ObsidianCon", { fg = "#fe8019" }) -- Orange
		hl(0, "ObsidianFire", { fg = "#fb4934" }) -- Red
		hl(0, "ObsidianKey", { fg = "#fabd2f" }) -- Yellow
		hl(0, "ObsidianWin", { fg = "#d3869b" }) -- Purple
		hl(0, "ObsidianUp", { fg = "#b8bb26" }) -- Green
		hl(0, "ObsidianDown", { fg = "#fb4934" }) -- Red
	end,
}
