" Syntax Highlighting
if has("syntax")
    syntax on
endif

" Resume from last position
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" Keybindings
inoremap jj <ESC>

" Tab
set autoindent
set ts=4
set sts=4
set shiftwidth=4

set showmatch " Highlight parenthesis
set hlsearch " Highlight matched strings
set ruler " Show current location 
set smartcase " Identify 
set mouse=a " Activate mouse
set ignorecase " Ignore upper case or lower case
set smartcase " Consider when an upper case is used
