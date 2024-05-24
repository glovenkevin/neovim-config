set encoding=UTF-8
set clipboard=unnamedplus

" :set number relativenumber
:set number 
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0#

" set default path
let $PATH= '/Users/waresix/.nvm/versions/node/v16.14.0/bin:' . $PATH
let g:node_host_prog='/usr/local/bin/neovim-node-host'

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Tabline Icon and functionality
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

"> file searching vsocde like
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"> Theme config
Plug 'joshdick/onedark.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

"> go
Plug 'https://github.com/fatih/vim-go' 
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/sirver/UltiSnips'
"> End of GO
"
"> React TS
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
"> End of React

call plug#end()

" NerdTree Shortcut
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Commentary Shortcut
nnoremap <leader>\ :Commentary<CR>
autocmd FileType conf,sh,text setlocal commentstring=#\ %s
autocmd FileType vue,ts,tsx setlocal commentstring=//\ %s

" Start NERDTree and put the cursor back to the window.
" autocmd VimEnter * NERDTree | wincmd p

:set completeopt-=preview " For No Previews

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeShowHidden=1
let g:NERDTreeIgnore=['^node_modules$']

" Warning and error sign
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

let g:NERDTreeGitStatusUseNerdFonts = 1

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Color Scheme
if (has("termguicolors"))
	set termguicolors
endif
syntax on
colorscheme onedark

" Insert Mode Shortcut
:inoremap ii <Esc>
:inoremap jj <Esc>

" Coc Config
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

inoremap <silent><expr> <C-space> coc#refresh()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent> ,s <C-r>=CocActionAsync('showSignatureHelp')<CR>

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Fzf config
nnoremap <C-p> :FZF<Cr>
let $FZF_DEFAULT_COMMAND = 'find . \( -name pb -o -name node_modules -o -name mysql-data -o -name vendor -o -name .git \) -prune -o -print'

" Lua config
" lua require('config')
