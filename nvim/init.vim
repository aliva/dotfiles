" general
" =============================================================================
syntax on
let mapleader = ","

lua require('options')

" Plugins
" =============================================================================
call plug#begin()
Plug 'editorconfig/editorconfig-vim'
Plug 'farmergreg/vim-lastplace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lambdalisue/suda.vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" autocompletion
Plug 'ervandew/supertab'
" colorscheme
Plug 'nlknguyen/papercolor-theme'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

lua require('mappings')

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

" editorconfig
let g:EditorConfig_core_mode = 'external_command'
" supertab
let g:SuperTabMappingForward = '<c-tab>'
let g:SuperTabMappingBackward = '<tab>'
let g:SuperTabCrMapping = 1
" ctrl-p
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
" tagbar
let g:tagbar_case_insensitive = 1
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_autofocus = 1
let g:tagbar_sort = 1
