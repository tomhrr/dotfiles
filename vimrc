set nocompatible

map ;; i#!/usr/bin/perluse warnings;use strict;
map <C-U> :!urlview %<CR>
map <C-T> :NERDTreeToggle<CR>
map <C-k> :lprevious<CR>
map <C-l> :lnext<CR>
map <leader>gf :e <cfile><cr>
map <leader>p :CtrlP<CR><C-\>w
map <leader>ge :%s/>[  ]\{4}/>>/<CR>
:command S SyntasticCheck

set history=1000
set wildmode=list:longest
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

nnoremap <C-e> 4<C-e>
nnoremap <C-y> 3<C-y>
set ruler

set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
set hlsearch
set incsearch
set path+=**
set wildmenu
set wildmode=list:longest,full

set backspace=indent,eol,start
syntax enable

colorscheme default
set tw=70

autocmd BufNewFile,BufRead *.s    set syntax=off
autocmd BufNewFile,BufRead *.txt  set syntax=off
autocmd BufNewFile,BufRead *.t    set syntax=perl
autocmd BufNewFile,BufRead *.spec set tw=0
autocmd BufNewFile,BufRead *.html set tw=0
autocmd BufNewFile,BufRead /tmp/mutt-* :silent! %s/^\([>|]\s\?\)\+/\=substitute(submatch(0), '\s', '', 'g').' '
autocmd BufNewFile,BufRead /tmp/mutt-* :silent! %s/¹/'/g
autocmd BufNewFile,BufRead /tmp/mutt-* :silent! %s/²/'/g
autocmd BufNewFile,BufRead /tmp/mutt-* :silent! %s/³/'/g
autocmd BufNewFile,BufRead /tmp/mutt-* :silent! %s/Œ/'/g
autocmd BufNewFile,BufRead /tmp/mutt-* :silent! %s/﻿//g

let g:ctrlp_custom_ignore = 'target'

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']
let g:syntastic_always_populate_loc_list = 1

highlight mailQuoted1 ctermfg=21
highlight mailQuoted2 ctermfg=160
highlight mailQuoted3 ctermfg=black
highlight mailQuoted4 ctermfg=darkred
highlight mailQuoted5 ctermfg=darkblue

highlight diffAdded ctermfg=black
highlight diffAdded ctermbg=255
highlight diffRemoved ctermfg=darkred

set shell=/usr/bin/bash
