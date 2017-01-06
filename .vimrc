" vundle config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'artur-shaik/vim-javacomplete2'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" vundle config

" javacomplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" set text format
set fileformat=unix
set encoding=utf-8

" enable syntax highlight
syntax enable
syntax on

" set background
set background=dark

" set status bar always show
set laststatus=1

" show current line number
set ruler

" set line number always show
set number

" set current row[column] hightlight
set cursorline
"set cursorcolumn

" set backspace in insert mode
set backspace=indent,eol,start

" set search result highlight
set hlsearch

" disable wrap line
set nowrap

" enable autoindent by lang
"filetype indent on

" use space replace tab
set expandtab
set ts=4
set sw=4
set sts=4

" font
set gfn=Yahei\ Mono\ 11

" keymap
nnoremap <F5> :!python %<CR>
nnoremap <F3> :!gcc -o %< %<CR>
map <silent> <F4> :!ctags -R<CR> :TlistUpdate<CR> :TlistToggle<CR> 
nnoremap <F9> :set wrap<CR>

" taglist

