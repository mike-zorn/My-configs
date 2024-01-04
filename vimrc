" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

"Plug 'kien/ctrlp.vim'
"Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'vim-airline/vim-airline'
"Plug 'gcmt/taboo.vim'
"Plug 'ervandew/supertab'
"Plug 'w0rp/ale'
"Plug 'airblade/vim-gitgutter'
"Plug 'fatih/vim-go'
"Plug 'machakann/vim-highlightedyank'
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'vim-scripts/dbext.vim'
"Plug 'dag/vim-fish'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'hashivim/vim-terraform'
"Plug 'ianks/vim-tsx'
"Plug 'leafgarland/typescript-vim'
"Plug 'neovim/nvim-lspconfig'

call plug#end()

" Make CTRL-T work correctly with goto-definition.
" need a newer neovim version for this to work 0.5+
" setlocal tagfunc=CocTagFunc
" for now, just remap the jumplist one to CTRL-T
"nmap <silent> <C-t> <C-o>
"
"
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gty <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
"let g:go_def_mapping_enabled = 0
"let g:go_fmt_command = "goimports"
"let g:go_fmt_options = { 'goimports': '-local github.com/launchdarkly,gopkg.in/launchdarkly' }
"let g:go_info_mode='gopls'
"let g:go_doc_popup_window = 1
"let g:go_term_enabled = 1
"let g:go_autodetect_gopath = 0
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_types = 1
"let g:go_auto_sameids = 1
"let g:go_addtags_transform = "camelcase"
"
"let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
"
"let g:terraform_fmt_on_save=1



set noshowmode
set nocompatible
set autoindent
set smartindent
set ts=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nonumber
set inccommand=split

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
colorscheme dracula

filetype plugin on
syntax on
filetype plugin indent on
autocmd FileType markdown setlocal tw=0

"" Show hidden files
let NERDTreeShowHidden=1

"" Set spell for git commits
au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
au BufNewFile,BufRead PULLREQ_EDITMSG setlocal spell
au BufNewFile,BufRead PULLREQ_EDITMSG set bufhidden=delete
autocmd FileType gitcommit set bufhidden=delete
autocmd FileType gitrebase set bufhidden=delete

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
"let g:ale_linters = {
"\   'javascript': ['eslint'],
"\   'go': ['golangci-lint'],
"\}
"let g:ale_fixers = {
"\   'javascript': ['prettier'],
"\   'typescript': ['prettier'],
"\   'css': ['prettier'],
"\}
"let g:ale_go_golangci_lint_package = 1
"let g:ale_go_golangci_lint_options = ''
"let g:ale_sign_column_always = 0
"let g:ale_fix_on_save = 1
"" Set this. Airline will handle the rest.
"let g:airline#extensions#ale#enabled = 1
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)

set mouse=a
if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif
