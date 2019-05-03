if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin Loading
call plug#begin()
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" Settings for latexmk
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" Backup folder
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

" Vim general stuff
set ruler           " Show curser position
set showcmd         " Incomplete command displayed
set history=50      " Length of history
set number relativenumber    " Line numbering
set showmatch       " Jump to matching bracket
set autoindent      " Automatic indentation
"set copyindent      " Indentation of previous line
set textwidth=100   " Number of columns before automatic line break
"set colorcolumn=100 " Colored column
set backspace=indent,eol,start "Backspacing beyond starting point of insert mode
set linebreak       " Linebreak at space instead of space
set wrapscan        " Search starts again at top hitting bottom
set incsearch       " highlighting while typed what is searched
set lazyredraw      " Do not redraw screen when running macros
set hidden          " Hide buffers when abandoned

" Tabs
set tabstop=8       " Default, reminder
set softtabstop=4   " recommended
set shiftwidth=4    " When pressing <tab>
set expandtab       " Expand <tab> to spaces

" Folding
"set foldcolumn=6    " Width of fold column
"set foldmethod=indent   " Fold for every level of indent
"set foldlevel=99    " Do not close folds
"set foldenable      " Enable or disable folding

"
" Key Mappings
"
let mapleader = ","

" Moving between split windows more naturally

map <C-j> <C-W><C-J>
map <C-k> <C-W><C-K>
map <C-l> <C-W><C-L>
map <C-h> <C-W><C-H>

" Moving visual lines
noremap k gk
noremap j gj

"command! -nargs=+ Calc :py3 print(<args>)
"py3 from math import *

" Ultisnips

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="/home/mairhofer/.vim/snips"
let g:UltiSnipsSnippetDirectories=["snips", "UltiSnips"]
