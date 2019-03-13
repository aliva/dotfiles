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
set wildignore+=__pycache__/
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

call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'farmergreg/vim-lastplace'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'taDaa/vimade'
Plug 'junegunn/fzf.vim'
call plug#end()

color dracula

" autosave on focus lost
autocmd FocusLost * try | :wa | catch | endtry

let mapleader = ","
let g:LanguageClient_serverCommands = {
  \ 'python': ["/usr/sbin/pyls"]
  \ }

nnoremap <silent> <C-S-R> :GFiles<CR>

let g:deoplete#enable_at_startup = 1
