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
"  6 multiple windows
set laststatus=2
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

" Shougo
Bundle "Shougo/unite.vim"
Bundle "Shougo/vimproc.vim"
Bundle "Shougo/neocomplete.vim"
Bundle "Shougo/neosnippet.vim"
Bundle "Shougo/vimfiler.vim"
Bundle "Shougo/vimshell.vim"
" syntax
Bundle "elzr/vim-json"
Bundle "ekalinin/Dockerfile.vim"
Bundle "mitsuhiko/vim-jinja"
" color
Bundle "altercation/vim-colors-solarized"
Bundle "sickill/vim-monokai"
Bundle "gosukiwi/vim-atom-dark"
" other
Bundle "nathanaelkane/vim-indent-guides"
Bundle "bling/vim-airline"
Bundle 'airblade/vim-gitgutter'
Bundle "mhinz/vim-startify"

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
" OmniComplete
" enter key fix
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    "return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" gitgutter
nmap <Leader>ggn <Plug>GitGutterNextHunk
nmap <Leader>ggN <Plug>GitGutterPrevHunk
nmap <Leader>gga <Plug>GitGutterStageHunk
nmap <Leader>ggr <Plug>GitGutterRevertHunk
" }}}
" plugin {{{
" indentguide
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_default_mapping = 0
" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 100
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#manual_completion_start_length = 1
let g:neocomplete#enable_smart_case = 1
" neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippets'
" vimfiler
let g:vimfiler_as_default_explorer = 1
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
" css
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" html
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
" javascript
autocmd FileType js setlocal filetype=javascript
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" markdown
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
" python
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" xml
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }}}
" colorscheme {{{
set t_Co=256
if has("gui_running")
    "colorscheme monokai
    colorscheme atom-dark
    "colorscheme solarized
    set background=dark
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
