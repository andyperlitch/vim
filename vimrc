" --------------------------------------------------
"  1 important
" --------------------------------------------------
set nocompatible
set pastetoggle=<F2>

" --------------------------------------------------
"  2 moving around, searching and patterns
" --------------------------------------------------
set incsearch
set showmatch
set smartcase
set ignorecase

" --------------------------------------------------
"  3 tags
" --------------------------------------------------

" --------------------------------------------------
"  4 displaying text
" --------------------------------------------------
set number
set linebreak
set scrolloff=4
"set list
"set listchars=tab:⇾\ ,eol:¬


" --------------------------------------------------
"  5 syntax, highlighting and spelling
" --------------------------------------------------
"set hlsearch
set t_Co=256
syntax on
colorscheme codeschool
filetype on
highlight Search cterm=underline

" --------------------------------------------------
"  6 multiple windows
" --------------------------------------------------
set laststatus=2
set splitright
set hidden

" --------------------------------------------------
"  7 multiple tab pages
" --------------------------------------------------

" --------------------------------------------------
"  8 terminal
" --------------------------------------------------

" --------------------------------------------------
"  9 using the mouse
" --------------------------------------------------
set mouse=a

" --------------------------------------------------
" 10 printing
" --------------------------------------------------

" --------------------------------------------------
" 11 messages and info
" --------------------------------------------------
set showcmd
set ruler

" --------------------------------------------------
" 12 selecting text
" --------------------------------------------------
set noshowmode

" --------------------------------------------------
" 13 editing text
" --------------------------------------------------

" --------------------------------------------------
" 14 tabs and indenting
" --------------------------------------------------
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround

" --------------------------------------------------
" 15 folding
" --------------------------------------------------

" --------------------------------------------------
" 16 diff mode
" --------------------------------------------------

" --------------------------------------------------
" 17 mapping
" --------------------------------------------------

" --------------------------------------------------
" 18 reading and writing files
" --------------------------------------------------
set directory=~/.vim/swap//
"set autowrite

" --------------------------------------------------
" 19 the swap file
" --------------------------------------------------

" --------------------------------------------------
" 20 command line editing
" --------------------------------------------------
set wildmenu
set wildmode=full
set undofile
set undodir=~/.vim/undo//

" --------------------------------------------------
" 21 executing external commands
" --------------------------------------------------
set keywordprg=

" --------------------------------------------------
" 22 running make and jumping to errors
" --------------------------------------------------

" --------------------------------------------------
" 23 language specific
" --------------------------------------------------
set iskeyword=@,48-57,_,192-255,-

" --------------------------------------------------
" 24 multi-byte characters
" --------------------------------------------------

" --------------------------------------------------
" 25 various
" --------------------------------------------------
set gdefault

" --------------------------------------------------
" temporary files
" --------------------------------------------------

" --------------------------------------------------
" gui settings
" --------------------------------------------------
if has("gui")
	set guioptions-=T " Removes top toolbar
	set guioptions-=r " Removes right hand scroll bar
	set go-=L " Removes left hand scroll bar
	set guifont=Inconsolata\ for\ Powerline:h18
	colorscheme codeschool
	set linespace=3
	hi NonText guifg=bg
endif



" --------------------------------------------------
" mappings 
" --------------------------------------------------
let mapleader=','
cmap jj <esc>
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == "h" ? "vert h" : "h"
cnoreabbrev <expr> t getcmdtype() == ":" && getcmdline() == "t" ? "tabe" : "t"
imap jj <esc>
imap <leader>sv <esc>:so $MYVIMRC<cr>a
imap <leader>w <esc>:w!<cr>
"nnoremap / /\v
nnoremap <C-J> O<Esc>j
nnoremap <leader><leader> <c-^>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>. :bn<cr>
nnoremap <leader>sh :helptags ~/.vim/doc<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap <leader>h :vert h 
nnoremap <leader>t :bn<cr>
nnoremap <leader>v <c-W>L
nmap <leader>w :w!<cr>
nmap <leader>d :bd<cr>
nmap <leader>q :q<cr>
nnoremap \ ,
"vnoremap / /\v
nnoremap j gj
nnoremap k gk

" --------------------------------------------------
" autocommands 
" --------------------------------------------------
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

augroup vimscript
    autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd FileType vim nnoremap <buffer> K :call OpenOptionUnderCursor()<cr>
augroup END

augroup HTML
    autocmd!
	autocmd FileType html nnoremap <buffer> <leader>c I<!--<esc>A--><esc>
augroup END

" --------------------------------------------------
" functions 
" --------------------------------------------------
function! TabCompletion()
	let col = col(".") - 1
	if !col || getline(".")[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-n>"
endfunction
inoremap <tab> <c-r>=TabCompletion()<cr>
inoremap <s-tab> <c-p>

function! SearchForOption(option)
	silent exec "options" | redraw!
	silent exec "/^".a:option."" | redraw!
	silent exec "normal! \<c-W>L"
endfunction

function! OpenOptionUnderCursor()
	let line= getline(".")
	let option=matchstr(line, 'set \(no\|\)\zs\(\a*\)')
	if option == ''
		let option=matchstr(line, '\" \zs\(.*\)')
	endif
	silent exec "call SearchForOption(\'".option."\')"
endfunction

" --------------------------------------------------
" plugins 
" --------------------------------------------------
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>b :CtrlPBuffer<cr>
