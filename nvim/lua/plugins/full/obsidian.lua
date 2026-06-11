return {
	"obsidian-nvim/obsidian.nvim", -- maintained community fork; epwalsh/obsidian.nvim is archived
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		legacy_commands = false, -- use `:Obsidian <subcommand>` only
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
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
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

		checkbox = {
			order = { " ", "x" }, -- toggle between todo/done only
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

		link = { style = "wiki" },
	},
	config = function(_, opts)
		require("obsidian").setup(opts)
		local hl = vim.api.nvim_set_hl

		hl(0, "ObsidianTodo", { fg = "#d3c6aa" })
		hl(0, "ObsidianRefersTo", { fg = "#dbbc7f" })
		hl(0, "ObsidianDone", { fg = "#a7c080" })
		hl(0, "ObsidianCancelled", { fg = "#859289" })
		hl(0, "ObsidianRightArrow", { fg = "#859289" })
		hl(0, "ObsidianLeftArrow", { fg = "#859289" })

		-- Extras
		hl(0, "ObsidianQuestion", { fg = "#83c092" })
		hl(0, "ObsidianImportant", { fg = "#e69875" })
		hl(0, "ObsidianStar", { fg = "#dbbc7f" })
		hl(0, "ObsidianQuote", { fg = "#a7c080" })
		hl(0, "ObsidianLocation", { fg = "#e67e80" })
		hl(0, "ObsidianBookmark", { fg = "#e69875" })
		hl(0, "ObsidianInfo", { fg = "#83c092" })
		hl(0, "ObsidianSavings", { fg = "#a7c080" })
		hl(0, "ObsidianIdea", { fg = "#dbbc7f" })
		hl(0, "ObsidianProp", { fg = "#a7c080" })
		hl(0, "ObsidianCon", { fg = "#e69875" })
		hl(0, "ObsidianFire", { fg = "#e67e80" })
		hl(0, "ObsidianKey", { fg = "#dbbc7f" })
		hl(0, "ObsidianWin", { fg = "#d699b6" })
		hl(0, "ObsidianUp", { fg = "#a7c080" })
		hl(0, "ObsidianDown", { fg = "#e67e80" })
	end,
}
