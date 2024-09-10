require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls", "jsonls",
		"eslint", "ts_ls", "quick_lint_js",
		"golangci_lint_ls", "gopls"
	}
})
require("mason-null-ls").setup({
	ensure_installed = {
		"prettier", "gofumpt"
	}
})

local lsp = require("lspconfig")
local on_attach = function (_, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { buffer = bufnr, noremap = true, silent = true }
	vim.keymap.set('n', 'gy', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
end

local cmp = require("cmp")
cmp.setup {
	mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

	  ["<Tab>"] = cmp.mapping(function(fallback) 
		  if cmp.visible() then
			  cmp.select_next_item()
		  else 
			  fallback()
		  end
	  end, { "i", "s"}),
	  ["<S-Tab>"] = cmp.mapping(function(fallback) 
		  if cmp.visible() then
			  cmp.select_prev_item()
		  else 
			fallback()
		  end 
	  end, { "i", "s" })
    }),
	sources = cmp.config.sources ({
		{ name = 'nvim_lsp' },
	}, {
		{ name = 'buffer' },
	})
}


local capabilities = require("cmp_nvim_lsp").default_capabilities()
local langservers = { 'ts_ls', 'gopls', 'eslint' , 'golangci_lint_ls', 'jsonls', 'quick_lint_js' }
for _, l in ipairs(langservers) do
	lsp[l].setup {
		capabilities = capabilities,
		on_attach = on_attach,
	}
end

require("gitsigns").setup {
	signcolumn = true,
	current_line_blame = true,
}

require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"lua", "go", "gomod", "gosum",
		"javascript", "typescript", "tsx",
		"proto"
	}
}

local action = require("telescope.actions")
require("telescope").setup {
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
	    path_display = { "smart" },

		file_ignore_patterns = {
			'.git/', 'node_modules/', '.npm/', '*[Cc]ache/', '*-cache*', '.dropbox/',
		},
	},

	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
		}
	}
}
require("telescope").load_extension("fzf")

require("nvim-autopairs").setup()
