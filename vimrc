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
" 10 GUI
if has('gui_running')
    set guifont="Source Code Pro 11"
    set guioptions-=T " no toolbar
    set guioptions-=m " no menubar
endif
" 13 selecting text
set clipboard=unnamedplus
" 15 tabs and indenting
set tabstop=4
set shiftwidth=4
set expandtab
" 20 the swap file
set noswapfile
" 21 command line editing
set wildmode=longest,list,full
" mappings
" fast jump to head and tail of line
map H ^
map L $
" toggle line numbers
nmap <silent> <F1> :set number!<CR>
imap <silent> <F1> <ESC>:set number!<CR>a
nmap <silent> <C-F1> :set number!<CR>
imap <silent> <C-F1> <ESC>:set number!<CR>a
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
" autosave on focus lost
autocmd FocusLost * try | :wa | catch | endtry

