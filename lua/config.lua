local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options 
o.wrap			= true
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
o.syntax		= 'on'

--   A list of file patterns to ignore when performing expansion and completion.
o.wildignorecase	= true
o.wildignore		= o.wildignore .. '*.so,/min/*'
o.wildignore		= o.wildignore .. '.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*'
o.wildignore		= o.wildignore .. '*.jpg,*.jpeg,*.png,*.gif,*.log,**/tmp/**'
o.wildignore		= o.wildignore .. '**/node_modules/**,**/bower_modules/**,*/.sass-cache/*'
o.wildignore		= o.wildignore .. '__pycache__,*.egg-info'
o.wildignore		= o.wildignore .. '*.out,*.obj,*.gem,*.pyc,*DS_Store*'
o.wildignore		= o.wildignore .. '*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz'
o.wildignore		= o.wildignore .. '*.swp,*~,._*,*/vendor/cache/*'

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
vim.opt.signcolumn		= 'yes'
vim.opt.updatetime		= 300
vim.opt.cmdheight		= 5
vim.opt.termguicolors	= true
vim.cmd.colorscheme 'onedark'

-- global
vim.g.node_host_prog				= '/usr/local/bin/neovim-node-host'

vim.g.ale_echo_msg_format			= '[%linter%] %s [%severity%]'
vim.g.ale_sign_error				= '✘'
vim.g.ale_sign_warning				= '⚠'
vim.g.ale_lint_on_text_changed		= 'never'

vim.g.NERDTreeDirArrowExpandable	= "+"
vim.g.NERDTreeDirArrowCollapsible	= "~"
vim.g.NERDTreeGitStatusUseNerdFonts	= 1
vim.g.NERDTreeShowHidden			= 1
vim.g.NERDTreeFileLines				= 1

-- golang 
vim.g.go_diagnostics_enabled	= 0
vim.g.go_metalinter_enabled		= {}

-- fzf
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden'

