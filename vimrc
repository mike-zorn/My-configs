" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'gcmt/taboo.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'ervandew/supertab'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
\ 'javascript': ['flow-language-server', '--stdio'],
\ }

" (Optionally) automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

set noshowmode
set nocompatible
set autoindent
set smartindent
set ts=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nonumber

"" see :h fo-table
set tw=79
set formatoptions=tcroqn1
"Enable spell checking
set spelllang=en_us
set spellfile=~/.vim/en.utf-8.add
highlight clear SpellBad
highlight clear SpellRare
highlight clear SpellLocal
highlight clear SpellCap
highlight SpellBad   gui=undercurl cterm=underline ctermfg=red    guisp=red
highlight SpellRare  gui=undercurl cterm=underline ctermfg=red    guisp=orange
highlight SpellLocal gui=undercurl cterm=underline ctermfg=blue   guisp=blue
highlight SpellCap   gui=undercurl cterm=underline ctermfg=yellow guisp=Yellow
 
syntax enable
set background=dark
set ruler
set grepprg=grep\ -nH\ $*

filetype plugin on
syntax on
filetype plugin indent on
autocmd FileType markdown setlocal tw=0

"" Show hidden files
let NERDTreeShowHidden=1

"" Set spell for git commits
au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

"" clear the ctrl p cache
map <leader>cp :ClearCtrlPCache<CR>

"" Show nerdtree
map <leader>n :NERDTree<CR>

"" fugitive git grep window
autocmd QuickFixCmdPost *grep* cwindow

"" don't ctrlp node modules
set wildignore+=*/node_modules/*

"" move windows within terminal emulator
:tnoremap <C-w>h <C-\><C-n><C-w>h
:tnoremap <C-w>j <C-\><C-n><C-w>j
:tnoremap <C-w>k <C-\><C-n><C-w>k
:tnoremap <C-w>l <C-\><C-n><C-w>l

"" more scrollback in term emu
let g:terminal_scrollback_buffer_size = 100000

"" js linters
let g:ale_linters = {
\   'javascript': ['standard', 'flow'],
\}
let g:ale_sign_column_always = 0
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

set mouse=a
