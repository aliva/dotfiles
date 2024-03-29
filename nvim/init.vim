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
set colorcolumn=80,120
" 9 using the mouse
set mouse=a " enable mouse everywhere
" 12 selecting text
set clipboard=unnamedplus " use system clipboard
" 13 editing text
set completeopt=longest,menuone
set noundofile
set undodir=/tmp/$USER-vim-undo/
" 14 tabs and indenting
set tabstop=4
set shiftwidth=4
set expandtab
" 19 the swap file
set noswapfile
" 20 command line editing
set wildmode=longest:full,full
set wildignore+=__pycache__,
set wildignore+=*.pyc,
set wildignore+=*/env/*,
set wildignore+=.git,
set wildignore+=.vscode,
set wildignore+=.DS_Store,
" 25 various
set exrc
set secure
set signcolumn=yes

" Plugins
" =============================================================================
call plug#begin()
Plug 'farmergreg/vim-lastplace'
Plug 'lambdalisue/suda.vim'
Plug 'airblade/vim-gitgutter'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" autocompletion
Plug 'ervandew/supertab'
" colorscheme
Plug 'nlknguyen/papercolor-theme'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Mappings
" =============================================================================
" toggle line numbers
nmap <silent> <F1> :set number!<CR>
imap <silent> <F1> <ESC>:set number!<CR>a

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

" use ; as :
nnoremap ; :

" keep visual selection
vnoremap > >gv
vnoremap < <gv

" Auto Commands
" =============================================================================
" autosave on focus lost
autocmd FocusLost * try | :wa | catch | endtry

" Plugin Configs
" =============================================================================
"color dracula
"set background=light
"colorscheme PaperColor
colorscheme dracula

" supertab
let g:SuperTabMappingForward = '<c-tab>'
let g:SuperTabMappingBackward = '<tab>'
let g:SuperTabCrMapping = 1
" suda
let g:suda#prefix = 'sudo:'
let g:suda_smart_edit = 1
