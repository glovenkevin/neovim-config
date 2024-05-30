let $PATH = '/Users/waresix/.nvm/versions/node/v16.14.0/bin:' . $PATH


call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
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
Plug 'https://github.com/fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}

"> LSP
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'

"> Ts/React
Plug 'MunifTanjim/prettier.nvim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

call plug#end()

colorscheme onedark
lua << EOF
	require('config')
	require('keymap')
EOF
