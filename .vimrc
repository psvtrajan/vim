nnoremap <C-d> :wq!<cr>
inoremap <C-d> <esc>:wq!<cr>
nnoremap <silent> <C-q> :qa!<cr>
inoremap <silent> <C-q> <esc>:qa!<cr>
nnoremap <silent> <C-s> :w!<cr>
inoremap <silent> <C-s> <esc>:w!<cr>
nnoremap <C-a> :q!<cr>
inoremap <C-a> <esc>:q!<cr>

set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
colorscheme peachpuff
set shiftwidth=4
set tabstop=4
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle "myusuf3/numbers.vim"
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
set nonumber
"set tags=~/Desktop/3_CscopeCtags/tags
"execute pathogen#infect()
filetype plugin indent on
map <F5> :!cscope -Rb<CR> :cs reset<CR><CR>
"set csprg=/usr/bin/cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cst
set csverb
map <F9> :cs add ./cscope.out<CR>
set notimeout

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

"set ignorecase


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <F7>   m`:TrimSpaces<CR>``
vnoremap <F7>   :TrimSpaces<CR>

nmap <F6> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set nu


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
