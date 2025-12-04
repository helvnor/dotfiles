return {
	-- FORMATTERS --
	formatters = {
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		htmlangular = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
		markdown = { "prettierd", "prettier", stop_after_first = true },
		graphql = { "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		python = { "isort", "black" },
		sql = { "pg_format" },
		rust = { "rustfmt" },
		nix = { "nixfmt" },
		go = { "goimports" },
	},

	-- LINTERS --
	linters = {
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		dockerfile = { "hadolint" },
		python = { "flake8" },
		make = { "checkmake" },
		markdown = { "proselint" },
	},

	-- LSP --
	lsp = {
		"emmet_ls", -- HTML/CSS snippets
		"lua_ls", -- Lua
		"angularls", -- Angular
		"ts_ls", -- TypeScript/JavaScript
		"cssls", -- CSS
		"dockerls", -- Docker
		"gopls", -- Go
		"golangci_lint_ls", -- Go Lint
		"rust_analyzer", -- Rust
		"clangd", -- C/C++
		"html", -- HTML
		"pyright", -- Python
		"marksman", -- Markdown
		"tailwindcss", -- Tailwind CSS
		"nil_ls", -- Nix
		"sqls", -- SQL/PostgreSQL
		"templ", -- Go templating
		"graphql", -- GraphQL
		"sourcekit", -- Swift
	},

	-- TREESITTER --
	parsers = {
		"angular",
		"c",
		"lua",
		"rust",
		"go",
		"vim",
		"vimdoc",
		"query",
		"python",
		"typescript",
		"javascript",
		"html",
		"markdown",
		"dockerfile",
		"nix",
		"fish",
		"editorconfig",
		"css",
		"json",
		"hyprlang",
		"nginx",
		"yaml",
		"sql",
		"graphql",
		"regex",
		"bash",
		"swift",
	},
}
