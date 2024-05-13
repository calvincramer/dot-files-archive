" CALVIN CRAMER'S VIM CONFIG

" turn on line numbers
set number

" use space to scroll down
noremap <SPACE> <C-F>

" turn on syntax highlighting
syntax on

" colors
colorscheme morning

" Search case insensitive
set ignorecase

" Search case sensitive when search term is not all lowercase
set smartcase

" marker for 80 char max (plus one for newline)
" set colorcolumn=81

" Highlight all search matches
set hlsearch

" vimdiff colors:
if &diff
    " colorscheme morning
    highlight! link DiffText Todo
endif

"vimdiff no whitespace
set diffopt+=iwhite


" ALL VIM COLOR SCHEMES:
" blue        | bad
" darkblue    | bad
" delek       | not too clear
" default
" desert      |
" elflord     |
" evening     | eh
" industry    |
" koehler     |
" morning     | ok
" murphy      | doesn't look good
" pablo       |
" peachpuff   |
" ron         |
" shine       | bright
" slate       |
" torte       | ok
" zellner     | ok
