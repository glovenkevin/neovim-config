let $PATH = '/Users/waresix/.nvm/versions/node/v20.17.0/bin:' . $PATH

call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc

" Tabline Icon and functionality
Plug 'lewis6991/gitsigns.nvim'

"> file searching vsocde like
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

"> Theme config
Plug 'joshdick/onedark.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

"> go
Plug 'https://github.com/fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}

"> debugger
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-neotest/nvim-nio'

call plug#end()

lua << EOF
	require('config')
	require('setup')
	require('keymap')
	require('plugin')
	require('command')
EOF

