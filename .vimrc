execute pathogen#infect()

filetype plugin on
filetype indent on
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
set autoread

set background=dark

set incsearch
set wildmode=longest,list,full


"No redrawing during macros
set lazyredraw

set nobackup

nmap <C-n> :tabnext<CR>
nmap <c-p> :tabprevious<CR>

nmap j gj
nmap k gk

cmap w!! w !sudo tee > /dev/null %
cmap W w
cmap Q q

let mapleader = ","

let g:gitgutter_realtime = 1
let g:gitgutter_updatetime = 250
let g:gitgutter_sign_added = '·'
let g:gitgutter_sign_modified = '·'
let g:gitgutter_sign_removed = '·'
let g:gitgutter_sign_removed_first_line = '·'
let g:gitgutter_sign_modified_removed = '·'

let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_python_autopep8_executable = '/usr/bin/autopep8'

set noshowmode
set laststatus=2

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified', 'gitbranch'] ],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_function': {
\   'gitbranch': 'vim-gitbranch#detect'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }


function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction
