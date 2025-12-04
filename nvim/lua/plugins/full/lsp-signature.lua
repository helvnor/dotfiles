return {
	"ray-x/lsp_signature.nvim",
	enabled = true,
	event = "InsertEnter",
	opts = {
		bind = true,
		doc_lines = 10,
		max_height = 12,
		max_width = 80,
		wrap = true,
		handler_opts = {
			border = "rounded",
		},
		floating_window = true,
		hint_enable = true,
		hint_prefix = "🔍 ",
	},
}
