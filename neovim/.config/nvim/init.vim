" daniel's vimrc for windows gvim

" basics
let maplocalleader = ';'
let mapleader = ','
set cursorline
set backspace=indent,eol,start

" fixes for windows terminal
set t_u7=

" omnicompletion
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" swapfiles
set noswapfile

" vim-plug
call plug#begin()
Plug 'tpope/vim-surround'			" add/remove delimiters
Plug 'tpope/vim-fugitive'			" git integration
Plug 'tpope/vim-commentary'			" comment stuff out
Plug 'tpope/vim-vinegar'			" better netrw
Plug 'tpope/vim-sleuth'				" tab settings read from buffer
Plug 'tpope/vim-markdown'			" markdown runtime files
Plug 'tpope/vim-flagship'			" status line
"Plug 'tpope/vim-vividchalk'			" colorscheme
Plug 'tpope/vim-abolish'			" quickly search and replace words
Plug 'chriskempson/base16-vim'			" base16 color schemes
Plug 'jalvesaq/Nvim-R'				" R functionality
Plug 'nvim-treesitter/nvim-treesitter'          " Treesitter syntax highlighting and linting
Plug 'Aarleks/zettel.vim'			" Zettelkasten
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'rktjmp/lush.nvim'
"Plug 'loganswartz/selenized.nvim'
call plug#end()

" flagship status line
set laststatus=2
set showtabline=0
set guioptions-=e

" Selenized
"set termguicolors
"let g:selenized_variant = 'bw'
"set background=dark
"colorscheme selenized

" Base16 Colors
set termguicolors
colorscheme base16-ia-dark

" searching
set path+=**
set wildmenu
set incsearch
set hlsearch
nnoremap <silent> <C-c> :let @/ = "" <CR>

" lua script for NeoVim
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "r", "python" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Nvim-R options
let R_nvim_wd = 1
let R_rconsole_width = winwidth(0) / 2
autocmd VimResized * let R_rconsole_width = winwidth(0) / 2
let R_nvimpager = "tab"
let R_objbr_place = "console,above"
let R_assign_map = '<M-,>'
nnoremap '<M-.>' "%>% <CR>"

" Zettelkasten
let g:zettelkasten = 'C:\Users\dhenn\Zettelkasten\'
