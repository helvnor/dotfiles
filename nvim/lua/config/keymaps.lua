--
-- CONFIG --
--
-- Imports
local telescope = require("telescope.builtin")

-- New keymap function
function Keymap(input, output, desc, mode)
	local opts = {
		noremap = true,
		silent = true,
		desc = desc,
	}
	vim.keymap.set(mode or "n", input, output, opts)
end

--
-- GENERAL KEYMAPS --
Keymap("<F1>", "<Nop>", "Disable F1 help")
Keymap("Q", "<Nop>", "Disable Ex mode")
--
-- Window navigation: ctrl-[h,j,k,l]
Keymap("<C-h>", "<cmd>wincmd h<CR>", "Window navigation: Navigate to left window")
Keymap("<C-j>", "<cmd>wincmd j<CR>", "Window navigation: Navigate to lower window")
Keymap("<C-k>", "<cmd>wincmd k<CR>", "Window navigation: Navigate to upper window")
Keymap("<C-l>", "<cmd>wincmd l<CR>", "Window navigation: Navigate to right window")

-- Window arrangement: Leader->CTRL-[h,j,k,l]
Keymap("<leader><Left>", "<C-W><S-h>", "Window arrangement: Move window left")
Keymap("<leader><Down>", "<C-W><S-j>", "Window arrangement: Move window down")
Keymap("<leader><Up>", "<C-W><S-k>", "Window arrangement: Move window up")
Keymap("<leader><Right>", "<C-W><S-l>", "Window arrangement: Move window right")

-- Window resize: Leader->[h,j,k,l]
Keymap("<Left>", "<C-W>3<", "Window resize: Move window border left")
Keymap("<Down>", "<C-W>3+", "Window resize: Move window border down")
Keymap("<Up>", "<C-W>3-", "Window resize: Move window border up")
Keymap("<Right>", "<C-W>3>", "Window resize: Move window border right")

-- Tab management: Leader->t...
Keymap("<leader>tn", "<cmd>tabnew<cr>", "Tab management: Create new tab")
Keymap("<leader>tx", "<cmd>tabclose<cr>", "Tab management: Close current tab")
Keymap("<leader>t,", ":LualineRenameTab ", "Tab management: Rename current tab")
for i = 1, 9 do
	Keymap(
		string.format("<leader>%d", i),
		string.format("<cmd>tabnext %d<cr>", i),
		string.format("Tab management: Go to tab %d", i)
	)

	Keymap(
		string.format("<leader>t%d", i),
		string.format("<cmd>tabnext %d<cr>", i),
		string.format("Tab management: Go to tab %d (alt)", i)
	)

	Keymap(
		string.format("<leader>tm%d", i),
		string.format("<cmd>tabmove %d<cr>", i),
		string.format("Tab management: Move tab to position %d", i)
	)
end

--
-- PLUGIN KEYMAPS --

-- Copy / paste: Leader -> c
Keymap("<leader>cy", '"+y', "Copy selection to clipboard", "v")
Keymap("<leader>cp", '"+p', "Paste from clipboard", "")

-- Oil: -
Keymap("-", "<CMD>Oil --float<CR>", "Oil: Open Oil / Open parent directory")

-- Git: Leader -> g
Keymap("<leader>gk", "<cmd>DiffviewOpen<cr>", "Diffview: Open diffview")
Keymap("<leader>gj", "<cmd>DiffviewClose<cr>", "Diffview: Close diffview")
Keymap("<leader>gb", "<cmd>Gitsigns blame<cr>", "Gitsigns: Show gitblame")

-- Git: PR Review (diffview)
vim.keymap.set("n", "<leader>pr", function()
	vim.ui.input({ prompt = "Base branch: ", default = "main" }, function(branch)
		if branch then
			vim.cmd("DiffviewOpen origin/" .. branch .. "...HEAD --imply-local")
		end
	end)
end)

-- Diagnostics: Leader -> a
Keymap("<leader>aa", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Diagnostic: Show actions")
Keymap("<leader>ad", "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostic: Show diagnostics")
Keymap("<leader>aj", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, "Diagnostic: Go to next")
Keymap("<leader>ak", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, "Diagnostic: Go to previous")

-- Telescope: Leader -> f
Keymap("<leader>ff", telescope.find_files, "Telescope: Find files")
Keymap("<leader>fg", telescope.live_grep, "Telescope: Live grep")
Keymap("<leader>fb", telescope.buffers, "Telescope: Buffers")
Keymap("<leader>fv", telescope.git_status, "Telescope: Git status")
Keymap("<leader>fk", telescope.keymaps, "Telescope: Nvim keymaps")
Keymap("<leader>fs", telescope.grep_string, "Telescope: Selected word")
Keymap("<leader>fp", telescope.registers, "Telescope: Registers")
Keymap("<leader>fc", ":TodoTelescope<CR>", "Telescope: Comments (TODO)")

-- FULL
if not Is_minimal then
	local ng = require("ng")
	local harpoon = require("harpoon")

	-- DBUI: Leader -> d
	Keymap("<leader>d", "<cmd>tab DBUI<cr>", "DBUI: Open database UI")

	-- LSP
	Keymap("<leader>fd", telescope.lsp_definitions, "Telescope: LSP definitions")
	Keymap("<leader>fr", telescope.lsp_references, "Telescope: LSP references")
	Keymap("<leader>fi", telescope.lsp_implementations, "Telescope: LSP implementations")
	Keymap("<leader>ft", telescope.lsp_type_definitions, "Telescope: LSP type definitions")

	-- Obsidian: Leader -> o
	Keymap("<leader>fo", "<cmd>Obsidian search<cr>", "Obsidian: Search with Telescope")
	Keymap("<leader>od", "<cmd>Obsidian dailies -5 2<cr>", "Obsidian: Open Dailies")
	Keymap("<leader>on", "<cmd>Obsidian new_from_template<cr>", "Obsidian: New Note (from template)")
	Keymap("<leader>os", "<cmd>Obsidian search<cr>", "Obsidian: Search")
	Keymap("<leader>ol", "<cmd>Obsidian link<cr>", "Obsidian: Create link")
	Keymap("<leader>ot", "<cmd>Obsidian tags<cr>", "Obsidian: Tags")
	Keymap("<leader>ow", "<cmd>Obsidian workspace<cr>", "Obsidian: Workspace")
	Keymap("<leader>oh", "<cmd>Obsidian quick_switch 0<cr>", "Obsidian: Home")
	Keymap("<leader>ob", "<cmd>Obsidian backlinks<cr>", "Obsidian: Backlinks")
	Keymap("<leader>ox", "<cmd>Obsidian toggle_checkbox<cr>", "Obsidian: Toggle Todo/Done only")
	Keymap("<leader>oe", "<cmd>Obsidian extract_note<cr>", "Obsidian: Extract visually selected text into a new note")

	-- Angular: Leader -> n
	Keymap("<leader>nt", ng.goto_template_for_component, "Ng: Go to template file")
	Keymap("<leader>nc", ng.goto_component_with_template_file, "Ng: Go to component file")
	Keymap("<leader>nT", ng.get_template_tcb, "Ng: Get template typecheck block")

	-- Harpoon: Leader -> h
	local conf = require("telescope.config").values
	local function toggle_telescope(harpoon_files)
		local file_paths = {}
		for _, item in ipairs(harpoon_files.items) do
			table.insert(file_paths, item.value)
		end

		require("telescope.pickers")
			.new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			})
			:find()
	end

	Keymap("<leader>ha", function()
		harpoon:list():add()
	end, "Harpoon: Add file")
	Keymap("<leader>fh", function()
		toggle_telescope(harpoon:list())
	end, "Harpoon: Search files")
	Keymap("<leader>hh", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, "Harpoon: Toggle menu")
end
