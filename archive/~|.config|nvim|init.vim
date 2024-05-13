set nocompatible                " Needs to be first line

""""" General Options
set autoindent                  " indent a new line the same amount as the line just typed
set autoread                    " reload file when it has changed externally
set belloff=all                 " no bell
set clipboard=unnamedplus       " use system clipboard
set colorcolumn=180,200,220,240 " column borders
set confirm                     " prompt before losing info
"set cursorcolumn                " highlight current column
set cursorline                  " highlight current row
set diffopt=iwhite
set expandtab                   " converts tabs to white space
set fileignorecase              " ignore case for files
set foldcolumn=auto:4             " columns that shows areas/ranges to fold/expand
set foldmethod=syntax           " fold code on syntax
set foldlevelstart=99           " start with no code folded
set hlsearch                    " highlight all search results
set ignorecase                  " case insensitive searching
set incsearch                   " search while the search pattern is being typed
set loadplugins                 " yes, use plugins
set matchpairs+=<:>             " also match on < and > (as well as the default ()[]{})
set mouse=a                     " enable mouse support in all modes
set noshowmatch                 " jump to matching brace/paren briefly when typed
set number                      " line numbers on left
set shiftwidth=4                " width for autoindents
"set signcolumn=yes             " ?
set softtabstop=4               " see multiple spaces as tabstops so <BS> does the right thing
set spell                       " enable spell check (may need to download language package)
set swapfile                    " yes, use swap files.
set tabstop=4                   " number of columns occupied by a tab
set termguicolors               " Enables 24-bit terminal color support
set ttyfast                     " Speed up scrolling in Vim (doesn't actually do anything in nvim)
set wildignorecase              " ignore case in tab completion
set wildmenu                    " menu to see options in tab completion
set wildmode=list:longest,full  " tab completion in command line, like bash

filetype plugin indent on       " auto-indenting depending on file type
filetype plugin on              " enables file type detection

syntax on                       " syntax highlighting

" Turn off
"set matchtime=3                 " showmatch time (in tenths of seconds)

""""" Plug plugins
call plug#begin("~/.vim/plugged")
    " Color schemes
    " Plug 'dracula/vim'
    " Plug 'Mofiqul/dracula.nvim'
    Plug 'EdenEast/nightfox.nvim'   " https://github.com/EdenEast/nightfox.nvim

    " Code completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Code completion
    Plug 'SirVer/ultisnips'         " Code snippet completion
    Plug 'honza/vim-snippets'       " more code snippets

    " File explorer (see Lua config)
    "Plug 'scrooloose/nerdtree'      " don't like
    "Plug 'nvim-neo-tree/neo-tree.nvim', {'branch': 'v2.x'}

    " Etc
    Plug 'ryanoasis/vim-devicons'   " Icons
    Plug 'preservim/nerdcommenter'  " Smart commenting (HOW TO?)
    Plug 'mhinz/vim-startify'       " Start screen
    "Plug 'ryanoasis/nerd-fonts', {'branch': '2.1.0'} " Fonts - WAY TOO BIG of a repo to download, just downloaded the font myself here: https://www.nerdfonts.com/font-downloads then set the font in the terminal settings

    " Maybe:
    " https://github.com/xiyaowong/nvim-transparent
    " https://github.com/sunjon/Shade.nvim
call plug#end()

" Lua config
source $HOME/.config/nvim/_init.lua

" Set color scheme used
colorscheme duskfox    "carbonfox

" Colors - manually set by me
hi CursorLine guibg=#1e3137             " horizontal line on cursor
hi CursorColumn guibg=#0C262C gui=bold  " vertical line on cursor

" Toggle cursor row / line highlighting
:nnoremap H :set cursorline! cursorcolumn!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Press i to enter insert mode, and ii to exit insert mode.
" :inoremap ii <Esc>
" :inoremap jk <Esc>
" :inoremap kj <Esc>
" :vnoremap jk <Esc>
" :vnoremap kj <Esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scrooloose/nerdtree
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" let NERDTreeChDirMode=2
" let NERDTreeMouseMode=3
" let NERDTreeQuitOnOpen=0
" let NERDTreeMinimalUI=1
"let NERDTreeDirArrows=1
" let NERDTreeShowHidden=1
" let NERDTreeShowBookmarks=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neoclide/coc config:

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
