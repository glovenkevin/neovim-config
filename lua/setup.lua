local lsp = require "lspconfig"
local coq = require "coq"

-- Golang
lsp.gopls.setup{}
lsp.golangci_lint_ls.setup{}
