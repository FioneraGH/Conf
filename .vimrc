syntax on
filetype indent plugin on

""tabspace&&spacewidth
set ts=4
set sw=4
set ruler
set showcmd
""show the line number
set number
set completeopt+=longest
""font
set gfn=Courier\ 10\ Pitch\ 11

""keymap
nnoremap <F5> :!python %<CR>
nnoremap <F3> :!gcc -o %< %<CR>

""latex-suite
set grepprg=grep\-nH\$*
let g:tex_lavor='latex'
