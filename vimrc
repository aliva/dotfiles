" general {{{
syntax on
" leader key
let mapleader = ","
let maplocalleader = "\\"
" }}}
" options {{{
"  1 important
set nocompatible
"  2 moving around, searching and patterns
set incsearch
set ignorecase
set smartcase
" 10 GUI
if has('gui_running')
    set guifont="Source Code Pro 9"
    set guioptions-=T " no toolbar
    set guioptions-=m " no menubar
endif
" 15 tabs and indenting
set tabstop=4
set shiftwidth=4
set expandtab " convert tab to spaces
" 16 folding
set foldcolumn=2 " columns on right side of screen to show fold level
set foldmethod=marker " {}x3 to fold
" 20 the swap file
set noswapfile
" 21 command line editing
set wildmode=longest,list,full
" }}}
" vundle {{{
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()
Bundle "gmarik/vundle"

" autocomplete
Bundle "Shougo/neocomplete.vim"
" snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
" syntax
Bundle "elzr/vim-json"
"Bundle "honza/dockerfile.vim"
Bundle "ekalinin/Dockerfile.vim"
" color
Bundle "sickill/vim-monokai"
Bundle "gosukiwi/vim-atom-dark"

filetype plugin on
filetype indent on
" }}}
" mappings {{{
" ; => :
map ; :
" jj => <ESC>
imap jj <ESC>
" fast jump to head and tail of line
map H ^
map L $
" fold/unfold with space
map <space> za
" toggle line numbers
nmap <silent> <F1> :set number!<CR>
imap <silent> <F1> <ESC>:set number!<CR>a
nmap <silent> <C-F1> :set number!<CR>
imap <silent> <C-F1> <ESC>:set number!<CR>a
" quickly change filetype
map <leader>ft  :set filetype=
map <leader>ftjs  :set filetype=javascript<CR>
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
" switch windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" cd to file path
nmap <silent> <leader>cd :cd %:p:h<CR>:pwd<CR>
" toggle toolbar
if has("gui_running")
    map <silent> <F10> :call ToggleToolbar()<CR>
endif
" plugins
" }}}
" plugin {{{
" {{{ neocomplete
let g:neocomplete#enable_at_startup = 1
" }}}
" snipmate {{{
let g:snips_author="Ali Vakilzade <ali.vakilzade@gmail.com>"
" }}}
" }}}
" autocmd {{{
" autosave on focus lost
autocmd FocusLost * try | :wa | catch | endtry
" remove trailing white space
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" if cwd is ~ change it to ~/Workspace
if getcwd() == expand('$HOME')
    cd ~/Workspace
endif
" }}}
" filetypes {{{
" markdown {{{
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
" }}}
" }}}
" colorscheme {{{
set t_Co=256
if has("gui_running")
    "colorscheme monokai
    colorscheme atom-dark
endif
" }}}
" functions {{{
function! <SID>StripTrailingWhitespaces()
    " save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
function! ToggleToolbar()
    if &guioptions =~# "T"
        set guioptions-=T
        set guioptions-=m
    else
        set guioptions+=T
        set guioptions+=m
    endif
endfunction
" }}}
