"set text format
set fileformat=unix
set encoding=utf-8

"enable syntax highlight
syntax enable
syntax on

"set background
set background=dark

"set status bar always show
set laststatus=2

"show current line number
set ruler

"set line number always show
set number

"set current row[column] hightlight
set cursorline
"set cursorcolumn

"set backspace in insert mode
set backspace=indent,eol,start

"set search result highlight
set hlsearch

"disable wrap line
set nowrap

"enable autoindent by lang
filetype indent on

"use space replace tab
set expandtab
set ts=4
set sw=4
set sts=4

"font
set gfn=Ubuntu\ Mono\ 11

"keymap
nnoremap <F5> :!python %<CR>
nnoremap <F3> :!gcc -o %< %<CR>

