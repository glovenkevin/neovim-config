set encoding=UTF-8
set clipboard=unnamedplus

:set number relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0#

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Debugging purpose
Plug 'mfussenegger/nvim-dap'	" Neovim debug adapter 
Plug 'puremourning/vimspector'	" UI/UX for debugger 

" Tabline Icon and functionality
Plug 'kyazdani42/nvim-web-devicons' 

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

" air-line
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#buffer_nr_show = 1

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

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
let $FZF_DEFAULT_COMMAND = 'find . \( -name node_modules -o -name mysql-data -o -name vendor -o -name .git \) -prune -o -print'

" Vimspecotr for debugging 
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'vscode-go' ]

nmap <leader>vl :call vimspector#Launch()<CR>
nmap <leader>vr :VimspectorReset<CR>
nmap <leader>vo :VimspectorShowOutput

sign define vimspectorBP text=●         texthl=WarningMsg
sign define vimspectorBPCond text=◼     texthl=WarningMsg
sign define vimspectorBPDisabled text=○ texthl=LineNr
sign define vimspectorPC text=▶         texthl=MatchParen

function! s:SetUpUI() abort
  call win_gotoid( g:vimspector_session_windows.output )
  q
  call win_gotoid( g:vimspector_session_windows.watches )
  q

  call win_gotoid( g:vimspector_session_windows.variables )
  30wincmd _
  30wincmd |

  call win_gotoid( g:vimspector_session_windows.code )
  nunmenu WinBar
  nnoremenu WinBar.■\ Stop :call vimspector#Stop()<CR>
  nnoremenu WinBar.▶\ Continue :call vimspector#Continue()<CR>
  nnoremenu WinBar.▷\ Pause :call vimspector#Pause()<CR>
  nnoremenu WinBar.↷\ Next :call vimspector#StepOver()<CR>
  nnoremenu WinBar.→\ Step :call vimspector#StepInto()<CR>
  nnoremenu WinBar.←\ Finish :call vimspector#StepOut()<CR>
  nnoremenu WinBar.⟲: :call vimspector#Restart()<CR>
  nnoremenu WinBar.✕ :call vimspector#Reset()<CR>

endfunction

augroup VimspectorCustom
  autocmd!
  autocmd User VimspectorUICreated call s:SetUpUI()
augroup END

