local lsp = require "lspconfig"
local coq = require "coq"

lsp.pyright.setup{}

-- Golang
lsp.gopls.setup{}
lsp.golangci_lint_ls.setup{}
