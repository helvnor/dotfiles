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
			checkboxes = {
				-- Basics
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["/"] = { char = "󰶐", hl_group = "ObsidianRefersTo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				["-"] = { char = "󰅖", hl_group = "ObsidianCancelled" },
				[">"] = { char = "󰭹", hl_group = "ObsidianRightArrow" },
				["<"] = { char = "󰭸", hl_group = "ObsidianLeftArrow" },

				-- Extras
				["?"] = { char = "󰋗", hl_group = "ObsidianQuestion" },
				["!"] = { char = "󰀦", hl_group = "ObsidianImportant" },
				["*"] = { char = "󰓎", hl_group = "ObsidianStar" },
				['"'] = { char = "󰶶", hl_group = "ObsidianQuote" },
				["l"] = { char = "󰋽", hl_group = "ObsidianLocation" },
				["b"] = { char = "󰃀", hl_group = "ObsidianBookmark" },
				["i"] = { char = "󰋽", hl_group = "ObsidianInfo" },
				["S"] = { char = "󰠭", hl_group = "ObsidianSavings" },
				["I"] = { char = "󰌵", hl_group = "ObsidianIdea" },
				["p"] = { char = "", hl_group = "ObsidianProp" },
				["c"] = { char = "", hl_group = "ObsidianCon" },
				["f"] = { char = "󰈸", hl_group = "ObsidianFire" },
				["k"] = { char = "󰌆", hl_group = "ObsidianKey" },
				["w"] = { char = "󰀪", hl_group = "ObsidianWin" },
				["u"] = { char = "󰔶", hl_group = "ObsidianUp" },
				["d"] = { char = "󰔷", hl_group = "ObsidianDown" },
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
}
