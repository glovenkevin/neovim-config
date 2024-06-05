require('dap-go').setup {
	delve = {
		path = '~/go/bin/dlv',
		detached = true,
		cwd = nil,
	},
}

require("dapui").setup({
	layouts = { {
		elements = { {
			id = "scopes",
			size = 0.25
		}, {
			id = "breakpoints",
			size = 0.25
		}, {
			id = "stacks",
			size = 0.25
		}, {
			id = "watches",
			size = 0.25
		} },
		position = "left",
		size = 40
	}, {
		elements = { {
			id = "repl",
			size = 1
		}, },
		position = "bottom",
		size = 13
	} },
})

require('gitsigns').setup()

require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"gitignore",
		"lua", "go", "gomod", "gosum",
		"javascript", "typescript", "tsx", "css",
		"proto", "sql"
	}
}

require("telescope").setup {
	defaults = {
		mappings = {
			i = {
				["<esc>"] = require("telescope.actions").close
			}
		}
	},
	pickers = {
		find_files = {
			no_ignore = false,
			hidden = true
		}
	}
}
require("telescope").load_extension("fzf")
