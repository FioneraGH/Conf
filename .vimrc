" vundle config

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set shell=/bin/bash
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'

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

" enable folding
set foldmethod=indent
set foldlevel=99

" use space replace tab
set expandtab
set textwidth=79
set ts=4
set sw=4
set sts=4
set autoindent

" font
set gfn=Yahei\ Mono\ 11

" keymap
nnoremap <space> za

nnoremap <F5> :!python %<CR>
nnoremap <F3> :!gcc -o % < %<CR>
nnoremap <F9> :set wrap<CR>

" SimpylFold
let g:SimpylFold_docstring_preview = 1

" YouCompleteMe
let python_highlight_all=1
let g:ycm_python_binary_path='python'
let g:ycm_autoclose_preview_window_after_completion=1

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
