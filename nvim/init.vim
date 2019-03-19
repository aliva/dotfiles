" general
" =============================================================================
syntax on
let mapleader = ","

" options
" =============================================================================
" 1 important
set nocompatible
" 2 moving around, searching and patterns
set incsearch
set ignorecase
set smartcase
" 5 syntax, highlighting and spelling
set cursorline
" 9 using the mouse
set mouse=nv
" 12 selecting text
set clipboard=unnamedplus
" 13 editing text
" 14 tabs and indenting
set tabstop=4
set shiftwidth=4
set expandtab
" 19 the swap file
set noswapfile
" 20 command line editing
set wildmode=longest,list,full
set wildignore+=__pycache__/

" Plugins
" =============================================================================
call plug#begin()
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'farmergreg/vim-lastplace'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf.vim'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'taDaa/vimade'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
call plug#end()

" Mappings
" =============================================================================
" toggle line numbers
nmap <silent> <F1> :set number!<CR>
imap <silent> <F1> <ESC>:set number!<CR>a
" sudo write
cmap W!! w !sudo tee % >/dev/null
" no arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
" move in wrapped lines
map j gj
map k gk
" Quick open files
nnoremap <silent> <C-S-R> :GFiles<CR>
" use ; as :
nnoremap ; :

" Auto Commands
" =============================================================================
" autosave on focus lost
autocmd FocusLost * try | :wa | catch | endtry

" Plugin Configs
" =============================================================================
color dracula

let g:EditorConfig_core_mode = 'external_command'
let g:deoplete#enable_at_startup = 1
let g:SuperTabMappingForward = '<c-tab>'
let g:SuperTabMappingBackward = '<tab>'
let g:SuperTabCrMapping = 1
let g:python_host_prog = '/usr/sbin/python2'
let g:python3_host_prog = '/usr/sbin/python'
let g:airline#extensions#ale#enabled = 1
