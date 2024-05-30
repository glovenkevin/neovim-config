local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options 
o.clipboard		= 'unnamedplus'		-- use system clipboard
o.pumheight		= 15
o.pumblend		= 20
o.mouse			= a					-- enable on all mode
o.wildoptions	= 'pum'
o.encoding		= 'utf-8'
o.fileencoding	= 'utf-8'
o.softtabstop	= 4
o.shiftwidth	= 4
o.tabstop		= 4
o.smarttab		= true
o.backup        = false				-- some language server has trouble with it
o.writebackup   = false				-- some language server has problem with it
o.updatetime	= 250				-- frequency update
o.syntax		= 'on'
o.signcolumn	= 'yes:1'

-- window options
wo.number		= true
wo.breakindent	= true
wo.foldcolumn	= '1'
wo.foldenable	= true

-- buffer-local
bo.omnifunc		= 'lsp#omnifunc'
bo.textwidth	= 110
bo.autoindent	= true
bo.smartindent	= true
bo.copyindent	= true

vim.opt.listchars = {
    eol = "↴",
    space = " ",
}
vim.opt.termguicolors = true

-- global
vim.g.node_host_prog				= '/usr/local/bin/neovim-node-host'

vim.g.ale_echo_msg_format			= '[%linter%] %s [%severity%]'
vim.g.ale_sign_error				= '✘'
vim.g.ale_sign_warning				= '⚠'
vim.g.ale_lint_on_text_changed		= 'never'

vim.g.NERDTreeDirArrowExpandable	= "+"
vim.g.NERDTreeDirArrowCollapsible	= "~"
vim.g.NERDTreeIgnore				= "^node_modules$"
vim.g.NERDTreeGitStatusUseNerdFonts	= 1


-- Env
vim.env.FZF_DEFAULT_COMMAND	= 'find . ( -name pb -o -name node_modules -o -name mysql-data -o -name vendor -o -name .git ) -prune -o -print'
