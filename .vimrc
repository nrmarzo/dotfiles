" don't make vim compatible with vi
set nocompatible              

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" show line numbers
set number

" turn on syntax highlighting
syntax on


colorscheme wombat256

" turn off line wrap
set nowrap

" autocomplete menu
set wildmenu

" set command line height
set cmdheight=2

" set cursor line
set cursorline

" 2 status lines
set laststatus=2

" get rid of -- INSERT -- in status line
set noshowmode

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" remap ESC to jj
:inoremap jj <Esc>

" Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" reload files changed outside vim
set autoread

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for 
" new buffers
set fileformats=unix,dos

" indentation
set shiftwidth=4	" when reading, tabs are 4 spaces
set softtabstop=4	" in insert mode, tabs are 4 spaces


" remap
set pastetoggle=<F2>
nnoremap <F5> :NERDTreeToggle<CR>

let g:ctrlp_map = "<c-p>"
nnoremap <leader>t :CtrlPMixed<CR>


" ----------------------------------------------------------------
" -------------------------Plugins--------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'jiangmiao/auto-pairs.git'
Plugin 'scrooloose/nerdtree'
" Plugin 'vim-scripts/L9'
" Plugin 'vim-scripts/FuzzyFinder'
Plugin 'kien/ctrlp.vim'
" Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'tpope/vim-vinegar.git'
Plugin 'vim-syntastic/syntastic'
Plugin 'edkolev/tmuxline.vim'

Plugin 'alvan/vim-closetag'
Plugin 'mattn/emmet-vim'
Plugin 'skammer/vim-css-color'
Plugin 'flazz/vim-colorschemes'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"----------------------------------------------------------
"Syntastic Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0




"----------------------------------------------------------
"Closetag settings

" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


"----------------------------------------------------------------
" ----------------Tmux lightline------------------------------
" let g:tmuxline_powerline_separators = 0
"
"
"
"
"
"
"---------------------------------------------------------------
"--------------AIRLINE CONFIG--------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark_minimal'
let g:airline_powerline_fonts = 1

