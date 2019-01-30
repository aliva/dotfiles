" general
syntax on
" options
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
" 14 tabs and indenting
set tabstop=4
set shiftwidth=4
set expandtab
" 19 the swap file
set noswapfile
" 20 command line editing
set wildmode=longest,list,full
" mappings
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
" Plugin settings
let g:EditorConfig_core_mode='external_command'
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'
let g:NERDTreeQuitOnOpen=1
let g:deoplete#enable_at_startup=1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:python3_host_prog = '/usr/bin/python'
let g:python_host_prog = '/usr/bin/python'
let g:SuperTabMappingForward='<s-tab>'
let SuperTabMappingBackward='<tab>'

call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'aliva/vim-fish'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'
call plug#end()

color dracula

" autosave on focus lost
autocmd FocusLost * try | :wa | catch | endtry

let mapleader = ","
nmap <leader>n :NERDTreeToggle<cr>

