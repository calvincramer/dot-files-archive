set nocompatible                " Needs to be first line

""""" General Options
set autoindent                  " indent a new line the same amount as the line just typed
set autoread                    " reload file when it has changed externally
set belloff=all                 " no bell
set clipboard=unnamedplus       " use system clipboard
set colorcolumn=180,200,220,240 " column borders
set confirm                     " prompt before losing info
set cursorcolumn                " highlight current column
set cursorline                  " highlight current row
set expandtab                   " converts tabs to white space
set fileignorecase              " ignore case for files
set hlsearch                    " highlight all search results
set ignorecase                  " case insensitive searching
set incsearch                   " search while the search pattern is being typed
set loadplugins                 " yes, use plugins
set matchpairs+=<:>             " also match on < and > (as well as the default ()[]{})
set mouse=a                     " enable mouse support in all modes
set noshowmatch                 " jump to matching brace/paren briefly when typed
set number                      " line numbers on left
set shiftwidth=4                " width for autoindents
set softtabstop=4               " see multiple spaces as tabstops so <BS> does the right thing
set spell                       " enable spell check (may need to download language package)
set swapfile                    " yes, use swap files.
set tabstop=4                   " number of columns occupied by a tab
set termguicolors               " Enables 24-bit terminal color support
set ttyfast                     " Speed up scrolling in Vim (doesn't actually do anything in nvim)
set wildignorecase              " ignore case in tab completion
set wildmenu                    " menu to see options in tab completion
set wildmode=longest,full       " tab completion in command line

" TODO
" browsedir
" complete
" guifont
" look through all options after mouse: https://neovim.io/doc/user/options.html#'mouse'

filetype plugin indent on       " auto-indenting depending on file type
filetype plugin on              " enables file type detection

syntax on                       " syntax highlighting

" Turn off
"set matchtime=3                 " showmatch time (in tenths of seconds)

" Colors
hi CursorLine guibg=#1e3137     " cursorline
hi CursorColumn guibg=#0C262C gui=bold    " CursorColumn


""""" Plugins
" call plug#begin("~/.vim/plugged")
" Plug 'dracula/vim'
" Plug 'Mofiqul/dracula.nvim'
" Plug 'ryanoasis/vim-devicons'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'scrooloose/nerdtree'
" Plug 'preservim/nerdcommenter'
" Plug 'mhinz/vim-startify'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" call plug#end()

""""" Color schemes
" if (has("termguicolors"))
"     set termguicolors
" endif
" syntax enable

" colorscheme evening
" colorscheme dracula


""""" Press i to enter insert mode, and ii to exit insert mode.
" :inoremap ii <Esc>
" :inoremap jk <Esc>
" :inoremap kj <Esc>
" :vnoremap jk <Esc>
" :vnoremap kj <Esc>

:nnoremap H :set cursorline! cursorcolumn!<CR>




""""""""""""""""""""""""""""""""""""""""""""""
" Probably not going to use

" move split panes to left/bottom/top/right
" nnoremap <A-h> <C-W>H
" nnoremap <A-j> <C-W>J
" nnoremap <A-k> <C-W>K
" nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" open new split panes to right and below
" set splitright
" set splitbelow

" move line or visually selected block - alt+j/k
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv