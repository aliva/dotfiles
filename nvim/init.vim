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
set mouse=a " enable mouse everywhere
" 12 selecting text
set clipboard=unnamedplus " use system clipboard
" 13 editing text
set completeopt=longest,menuone
set undofile
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
set wildignore+=.git,
set wildignore+=.vscode,
" 25 various
set exrc
set secure
set signcolumn=yes

" Plugins
" =============================================================================
call plug#begin()
Plug 'editorconfig/editorconfig-vim'
Plug 'farmergreg/vim-lastplace'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lambdalisue/suda.vim'
Plug 'scrooloose/nerdtree'
" autocompletion
"Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" sudo completeoptwrite
" cmap W!! w !sudo tee % >/dev/null
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
" use jj as esc
imap jj <Esc>
" keep selection
vnoremap > >gv
vnoremap < <gv
" Open NerdTree
map <c-s-e> :NERDTreeFocus<cr>

" Auto Commands
" =============================================================================
" autosave on focus lost
autocmd FocusLost * try | :wa | catch | endtry
" Auto open NERDTree
"autocmd vimenter * NERDTree

" Plugin Configs
" =============================================================================
"color dracula
set background=light
colorscheme PaperColor

" editorconfig
let g:EditorConfig_core_mode = 'external_command'
" deoplete
let g:deoplete#enable_at_startup = 1
" supertab
let g:SuperTabMappingForward = '<c-tab>'
let g:SuperTabMappingBackward = '<tab>'
let g:SuperTabCrMapping = 1
" python
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
" airline
let g:airline_powerline_fonts = 1
" ctrl-p
let g:ctrlp_map = '<c-s-r>'
let g:ctrlp_show_hidden = 1 
" suda
let g:suda#prefix = 'sudo:'
let g:suda_smart_edit = 1
" nerdtree
let NERDTreeRespectWildIgnore = 1
let NERDTreeMouseMode = 3
let NERDTreeShowHidden = 1
let NERDTreeDirArrowCollapsible = '-'
let NERDTreeDirArrowExpandable = '+'
let NERDTreeMinimalUI = 1
