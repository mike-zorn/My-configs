set nocompatible
set autoindent
set smartindent
set ts=4
set softtabstop=4
set shiftwidth=4
set tw=79
set expandtab
syntax enable
set background=dark
set wildmenu
set ruler
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='okular'
let g:Tex_Folding=0
autocmd FileType tex set spell
filetype plugin on
filetype plugin indent on
autocmd FileType tex map <leader>vw :!okular %:r.pdf &>/dev/null & <CR>
autocmd FileType c map <leader>cc :make <CR>
autocmd FileType python set omnifunc=pythoncomplete#Complete
