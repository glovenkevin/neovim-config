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
