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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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

" Color Schema
colo murphy

" set text format
set fileformat=unix
set encoding=utf-8

" enable syntax highlight
syntax enable
syntax on

" set background
set background=dark

" set status bar always show
set laststatus=2

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
set guifont=Fira\ Code:h14

" keymap
nnoremap <F5> :!python %<CR>
nnoremap <F9> :set wrap<CR>

nmap <C-S> :w!<CR>
imap <C-S> <ESC>:w!<CR>i

" SimpylFold
let g:SimpylFold_docstring_preview = 1

nnoremap <space> za

" NERDTree
nnoremap <F3> :NERDTreeMirror<CR>
nnoremap <F3> :NERDTreeToggle<CR>

" YouCompleteMe
set completeopt=longest,menu
set pumheight=10

let python_highlight_all=1
let g:ycm_python_binary_path='python'

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf=0
let g:ycm_cache_omnifunc=0
let g:ycm_min_num_of_chars_for_completion=1
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/.ycm_extra_conf.py'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.','re![_a-zA-z0-9]'],
  \   'cpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
  \ }
let g:ycm_key_invoke_completion = '<C-Space>'
"inoremap <expr> <CR>    pumvisible() ? '<C-y>' : '<CR>'  
map <leader>g   :YcmCompleter GoToDefinitionElseDeclaration<CR>

