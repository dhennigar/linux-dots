" daniel's vimrc for neovim
" linux version

" basics
let maplocalleader = ';'
let mapleader = ','
set cursorline
set backspace=indent,eol,start

" avoid hit-enter prompts
set cmdheight=2

" Shortcuts for terminals, splits etc.
nnoremap <Leader>tv :vsplit<CR>:term<CR>
nnoremap <Leader>th :split<CR>:term<CR>

nnoremap <Leader>tt :tabnew<CR>
nnoremap <Leader>tn :tabNext<CR>
nnoremap <Leader>tc :tabclose<CR>

nnoremap <M-h> <C-w><C-h>
nnoremap <M-j> <C-w><C-j>
nnoremap <M-k> <C-w><C-k>
nnoremap <M-l> <C-w><C-l>

" Indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Omnicompletion
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Swapfiles
set noswapfile

" Vim-Plug
call plug#begin()

" Tim Pope's excellent plugins
Plug 'tpope/vim-surround'			" add/remove delimiters
Plug 'tpope/vim-fugitive'			" git integration
Plug 'tpope/vim-commentary'			" comment stuff out
Plug 'tpope/vim-vinegar'			" better netrw
Plug 'tpope/vim-sleuth'				" tab settings read from buffer
Plug 'tpope/vim-markdown'			" markdown runtime files
Plug 'tpope/vim-flagship'			" status line
Plug 'tpope/vim-abolish'			" quickly search and replace words

" Colorschemes and syntax highlighting
Plug 'folke/tokyonight.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'rockerBOO/boo-colorscheme-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" NeoVim as an R IDE
Plug 'jalvesaq/Nvim-R'

" Quality of life things
Plug 'airblade/vim-rooter'

" NeoVim as a notetaking tool
Plug 'Aarleks/zettel.vim'

" FZF searching tool integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Flagship status line
set laststatus=2
set showtabline=0
set guioptions-=e

" Colors
set termguicolors
lua << EOF
 vim.g.material_style = 'darker'
 vim.cmd 'colorscheme material'
EOF

" Search
set path+=**
set wildmenu
set incsearch
set hlsearch
nnoremap <silent> <C-c> :let @/ = "" <CR>
let @/ = ""

" Rooter
let g:rooter_patterns = ['.git', 'renv', 'scripts', 'data', 'results']

" TreeSitter
lua << EOF
 require 'nvim-treesitter.configs'.setup {
   sync_install = true,
   auto_install = true,
   highlight = {
     enable = true,
     additional_vim_regex_highlighting = false,
   },
   indent = {
     enable = true
   }
 }
 require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
EOF

" Nvim-R
let R_nvim_wd = 1                                                     " use nvim's working directory
let R_rconsole_width = winwidth(0) / 2                                " the R console is 50% of the screen width
autocmd VimResized * let R_rconsole_width = winwidth(0) / 2           " resize the R console when the windows size changes
let R_nvimpager = 'tab'                                               " I don't remember what this does
let R_objbr_place = 'console,above'                                   " object browser placement
let R_assign_map = '<M-,>'
inoremap <M-m> %>%<CR>

" Zettelkasten
let g:zettelkasten = '~/notes/'
