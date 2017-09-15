syn on
set nu
set nocompatible

set expandtab
set shiftwidth=2
set softtabstop=2

set autoindent
set smartindent
set cindent

set autochdir

set background=dark

set incsearch
set wildmode=longest,list,full

filetype plugin on
filetype indent on

"No redrawing during macros
set lazyredraw

nmap <C-n> :tabnext<CR>
nmap <c-p> :tabprevious<CR>

cmap w!! w !sudo tee > /dev/null &
