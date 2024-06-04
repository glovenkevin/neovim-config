require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls", "jsonls",
		"eslint", "tsserver", "quick_lint_js",
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
    }),
	sources = cmp.config.sources ({
		{ name = 'nvim_lsp' },
	}, {
		{ name = 'buffer' },
	})
}


local capabilities = require("cmp_nvim_lsp").default_capabilities()
local langservers = { 'tsserver', 'gopls', 'eslint' , 'golangci_lint_ls', 'jsonls', 'quick_lint_js' }
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

require("telescope").setup()
require("nvim-autopairs").setup()
