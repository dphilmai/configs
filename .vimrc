syntax enable 						" turns syntax highlighting on
colorscheme jellybeans              " defines the color scheme of syntax highlighting
filetype plugin indent on

set ruler                           "(ru) show the cursor position at all times
set showcmd                         "(sc) display an incomplete command in the lower right
set history=50                      "(hi) keep 50 lines of command history
set number relativenumber           "(nu) and relativenumber for hybrid style mode
set showmatch                       "(sm) briefly jumpt to matching bracket when one is inserted
set autoindent                      "(ai) turn on auto-indenting
set copyindent                      "(ci) when auto-indenting, use indenting format of prev. line
set textwidth=100					"(tw) number of columns before an automatic line break is
                                    "     inserted
set colorcolumn=100					"(cc) highligth the specficied column with color
"set formatoptions=croq             "(fo) influences how vim automatically formats text --> !TODO!
set backspace=indent,eol,start      "(bs) allows backspacing beyond starting point of insert mode,
                                    "     indents and line breaks
set winminheight=0                  "(wmh) the minimal height of the window when not the current
                                    "       one
set linebreak                       "(lbr) wrap long lines at a space instead of the middle of a
                                    "      word
set wrapscan                        "(ws) search continues at the top of the document when bottom
                                    "     hit
set incsearch                       "(is) highlighting while typed what is searched
"set ignorecase                     "(ic) ignore case in search patterns
"set smartcase                      "(scs) Does not ignore case when search term includes UPPER
set lazyredraw						" Do not redraw screen when running macors

" Buffer
set hidden 							" Hides buffers when abandoned

" Tabs stuff
set tabstop=8						" Default, just to remind
set softtabstop=4					" As recommended in :help tabstop
set shiftwidth=4					" When pressing <tab>
set expandtab						" Expand <tab> to spaces


"------------------------------------
"Folding
"-----------------------------------

set foldcolumn=6                    "(fdc) width of fold column (to see where folds are)
set foldmethod=indent               "(fdm) creates a fold for every level of indentation
set foldlevel=99                    "(fdl) do not close folds
set foldenable                      "(fen) enables or disables folding

"-----------------------------------
" backupdirs
"-----------------------------------

set backupdir=~/.tmp
set directory=~/.tmp				" temporary dir for smp and tmp files


"-----------------------------------
" Status line
"-----------------------------------

highlight StatusLine ctermbg=blue

"-----------------------------------
" File Specific Settings
"-----------------------------------

au FileType c,h setlocal mps+==:;   "Allow the match pairs operation (%) to work with '=' and ';'
au FileType c,h setlocal cindent



"-----------------------------------
" Abbreviations
"-----------------------------------

abbreviate #i #include
abbreviate #d #define
abbreviate cRWS call RemoveWhiteSpace()
abbreviate hs vs

"-----------------------------------
" Key Mappings
"-----------------------------------

let mapleader = ","

" Moving between split windows more naturally

map <C-j> <C-W><C-J>
map <C-k> <C-W><C-K>
map <C-l> <C-W><C-L>
map <C-h> <C-W><C-H>

" Moving visual lines
noremap k gk
noremap j gj

map <F7> mzgg=G`z

"Compile with g++
"map <F4> :w <CR> :!g++ -o prog main.c functions.c && ./prog <CR>

" Source the current file (useful for vimrc)
" End highlighting search, unfortunately gives e490 fold error
map <Leader>so :source %<CR>
map <Leader>h :nohl<CR>


"----------------------------------
" Functions
"----------------------------------

"Rename param1 tags to be param2 tags
function! RenameTag(param1, param2) abort
	:%s/<\(\/\?\)a:param1\(\_s*\)/<\la:param2\2/gci
endfunction

"Remove superfluous white space from the end of a line, Defined an abbreviation
" CRWS to call it
function! RemoveWhiteSpace() abort
	:%s/\s*$//g
	  :'^
	  "`.
endfunction

"REmove superfluous white space at save
au BufWritePre * :%s/\s\+$//e

" Rename Current File
function! RenameFile() abort
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>n :call RenameFile()<cr>


" Finding Files
set path +=**						" Search down into subfolders
									" Provides tab-completion for all file-related commands
set wildmenu						" Tab completion menu

" Tag Jumping:
" Create the 'tags' file
command! MakeTags !ctags -R

" Use <C-]> to jump to tag under cursor
" Use g <C-]> for ambigous tags
" Use <C-t> to jump back up the tag stack

"Latex mappings:
" nnoremap ,fr i\frac{}{}<ESC>F{;a
" nnoremap ,align i\begin{align}<CR>\end{align}<ESC>ko<C-I>

" TODO: Figure out if it is worth it
"Escape time delay
"set noesckeys
"set ttimeout
"set ttimeoutlen=1
"imap jj <ESC>
