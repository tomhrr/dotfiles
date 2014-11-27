set nocompatible

map ;; i#!/usr/bin/perluse warnings;use strict;
map <C-T> :NERDTreeToggle<CR>

set history=1000
set wildmode=list:longest
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
set ruler

set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
set hlsearch
set incsearch

set backspace=indent,eol,start
syntax enable

colorscheme default
set tw=70

autocmd BufRead *.txt  set syntax=off
autocmd BufRead *.t    set syntax=perl
autocmd BufRead *.spec set tw=0
autocmd BufRead *.html set tw=0
autocmd BufRead *.dt   set syntax=dale

let g:ctrlp_custom_ignore = '\.o'

execute pathogen#infect()
filetype plugin indent on
