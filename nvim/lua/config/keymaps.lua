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
Keymap("<leader><C-h>", "<C-W><S-h>", "Window arrangement: Move window left")
Keymap("<leader><C-j>", "<C-W><S-j>", "Window arrangement: Move window down")
Keymap("<leader><C-k>", "<C-W><S-k>", "Window arrangement: Move window up")
Keymap("<leader><C-l>", "<C-W><S-l>", "Window arrangement: Move window right")

-- Window resize: Leader->[h,j,k,l]
Keymap("<leader>h", "<C-W>5<", "Window resize: Move window border left")
Keymap("<leader>j", "<C-W>5+", "Window resize: Move window border down")
Keymap("<leader>k", "<C-W>5-", "Window resize: Move window border up")
Keymap("<leader>l", "<C-W>5>", "Window resize: Move window border right")

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

-->
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
Keymap("<leader>gg", "<cmd>CopilotChatToggle<cr>", "Copilot: Open chat")
vim.api.nvim_set_keymap("i", "<S-Tab>", "copilot#Accept('<CR>')", { expr = true, silent = true })

-- Diagnostics: Leader -> a
Keymap("<leader>aa", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Diagnostic: Show actions")
Keymap("<leader>ad", "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostic: Show diagnostics")
Keymap("<leader>aj", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Diagnostic: Go to next")
Keymap("<leader>ak", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Diagnostic: Go to previous")

-- Telescope: Leader -> f
Keymap("<leader>ff", telescope.find_files, "Telescope: Find files")
Keymap("<leader>fg", telescope.live_grep, "Telescope: Live grep")
Keymap("<leader>fb", telescope.buffers, "Telescope: Buffers")
Keymap("<leader>fv", telescope.git_status, "Telescope: Git status")
Keymap("<leader>fk", telescope.keymaps, "Telescope: Nvim keymaps")
Keymap("<leader>fs", telescope.grep_string, "Telescope: Selected word")
Keymap("<leader>fp", telescope.registers, "Telescope: Registers")
Keymap("<leader>fc", ":TodoTelescope undo<CR>", "Telescope: Comments (TODO)")

-- FULL
if not Is_minimal then
	local ng = require("ng")
	local harpoon = require("harpoon")

	-- DBUI: Leader -> d
	Keymap("<leader>d", "<cmd>:tab DBUI<cr>", "DBUI: Open diffview")

	-- LSP
	Keymap("<leader>fd", telescope.lsp_definitions, "Telescope: LSP definitions")
	Keymap("<leader>fr", telescope.lsp_references, "Telescope: LSP references")
	Keymap("<leader>fi", telescope.lsp_implementations, "Telescope: LSP implementations")
	Keymap("<leader>ft", telescope.lsp_type_definitions, "Telescope: LSP type definitions")

	-- Obsidian: Leader -> o
	Keymap("<leader>fo", ":ObsidianSearch<CR>", "Obsidian: Search with Telescope")
	Keymap("<leader>od", ":ObsidianDailies -5 2<CR>", "Obsidian: Open Dailies")
	Keymap("<leader>on", ":ObsidianNewFromTemplate<CR>", "Obsidian: New Note (from template)")
	Keymap("<leader>os", ":ObsidianSearch<CR>", "Obsidian: Search")
	Keymap("<leader>ol", ":ObsidianLink<CR>", "Obsidian: Create link")
	Keymap("<leader>ot", ":ObsidianTags<CR>", "Obsidian: Tags")
	Keymap("<leader>ow", ":ObsidianWorkspace<CR>", "Obsidian: Workspace")
	Keymap("<leader>oh", ":ObsidianQuickSwitch 0<CR>", "Obsidian: Home")
	Keymap("<leader>ob", ":ObsidianBacklink<CR>", "Obsidian: Backlinks")
	Keymap("<leader>ox", ":ObsidianToggleCheckbox<CR>", "Obsidian: Toggle Checkbox")
	Keymap("<leader>oe", ":ObsidianExtractNote<CR>", "Obsidian: Extract visually selected tet into a new note")

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
