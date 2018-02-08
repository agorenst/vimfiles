syntax on
filetype plugin indent on

let mapleader= "-"

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
:inoremap <esc> <nop>
:nnoremap ; :

:inoremap jk <esc>

:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set showcmd

" sane backspace behavior
set backspace=2

" case insensitive searching
set ic

" I like seeing numbered lines
set ruler
set number

" Don't let cursor get to the very edge of the screen
set scrolloff=5
set sidescrolloff=5

" tabs
set expandtab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" show whitespace:
set listchars=tab:>-,trail:-
set list

" useful macros:
nnoremap <leader>ninl I__declspec(noinline)<space><esc>

function! Shelve(name)
    exec "!tf shelve /noprompt ".a:name
endfunction
function! EditMe()
    exec "!tf edit ".expand("%:p")
endfunction
function! UndoMe()
    exec "!tf undo ".expand("%:p")
endfunction
function! BuildArch(archName)
    exec "!bdll ".a:archName
endfunction

" Update vimrc on every ed
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
