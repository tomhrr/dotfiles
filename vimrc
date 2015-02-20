set nocompatible

map ;; i#!/usr/bin/perluse warnings;use strict;
map <C-T> :NERDTreeToggle<CR>
map <C-k> :lprevious<CR>
map <C-l> :lnext<CR>
map <leader>gf :e <cfile><cr>
map <leader>p :CtrlP<CR><C-\>w
:command S SyntasticCheck

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

autocmd BufNewFile,BufRead *.txt  set syntax=off
autocmd BufNewFile,BufRead *.t    set syntax=perl
autocmd BufNewFile,BufRead *.spec set tw=0
autocmd BufNewFile,BufRead *.html set tw=0
autocmd BufNewFile,BufRead *.dt   set syntax=lisp
autocmd BufNewFile,BufRead /tmp/mutt-* :silent! %s/^\([>|]\s\?\)\+/\=substitute(submatch(0), '\s', '', 'g').' '

let g:ctrlp_custom_ignore = 'target\|\.o'

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']
let g:syntastic_always_populate_loc_list = 1

execute pathogen#infect()
