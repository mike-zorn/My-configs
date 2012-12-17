call pathogen#infect()
set nocompatible
set autoindent
set smartindent
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab

"" see :h fo-table
set tw=79
set formatoptions=tcroqn1

syntax enable
set background=dark
set ruler
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='apvlv'
let g:Tex_Folding=0
let g:Tex_MultipleCompileFormats='pdf'
autocmd FileType tex set spell
filetype plugin on
syntax on
filetype plugin indent on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal ts=2 softtabstop=2 shiftwidth=2
map <leader>jl 080lBi<CR><Esc>
