set nocompatible        "remove vi compatibility.
set showcmd             "shows incomplete cmds in lower right
set number              "show line number gutter
set ai                  " auto indenting
set history=100         " keep 100 lines of history
syntax on               " syntax highlighting
set synmaxcol=500       "default is 3000, can bog down editing files with very long lines
set encoding=utf8
set incsearch           "incremental search
set hlsearch            " highlight the last searched term
set expandtab           "use spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ttimeoutlen=50      " set timeout length when hitting escape (prevents pause when leaving insert mode with vim-airline)
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Show the filename in the window titlebar
set title
filetype off "for some reason vundle needs this off

" Vundle config
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" my bundles
" nice statusline
Bundle 'bling/vim-airline'
" syntax checking and such
Bundle 'scrooloose/syntastic'
" ctrl-p for quick searching
Bundle 'kien/ctrlp.vim'
" nerdtree obviously
Bundle 'scrooloose/nerdtree'
" visual indent guides
Bundle 'nathanaelkane/vim-indent-guides'
" git integration
Bundle 'tpope/vim-fugitive'
" buffer explorer
Bundle 'bufexplorer.zip'
" adds better begin/end matching for various blocks
Bundle 'matchit.zip'
" golang support
Bundle 'jnwhiteh/vim-golang'
" adds leader-leader commenting
Bundle 'tpope/vim-commentary'
" allow calling ack via :Ack
Bundle 'mileszs/ack.vim'

" colorscheme bundle
Bundle 'altercation/vim-colors-solarized'
Bundle 'Impact'

" Brief help
" :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ

" ident guide flags
let g:indent_guides_exclude_filetypes = ['nerdtree']

" syntastic flags
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E128'

filetype plugin on      "you can then turn them back on after loading via vundle
filetype plugin indent on

colorscheme impact "cli color scheme

set scrolloff=5 "keep at least 5 lines above/below

let g:indent_guides_enable_on_vim_startup = 1

set autochdir
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1

nnoremap <leader>n :NERDTree .<CR>

nnoremap <leader>rr :call Convert4SpaceTo2Space()<CR>

"disable creation of .vim/.netrwhist files when you accidentally vim a dir
let g:netrw_dirhistmax=0

autocmd BufWritePre * :%s/\s\+$//e "remove trailing spaces on saves
let &showbreak=repeat(' ', 2) "add some indentation to wrapped lines

" statusline {{{
let g:airline_powerline_fonts=1
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" }}}


" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

" }}}

"buffer navigation ctrl-j/h/k/l
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

"allows j/k to not skip past wrapped lines
noremap j gj
noremap k gk


"sets a backup dir to prevent ~ and .swp files from being generated in the
"same directory as the edited file.
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

"syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

function! Convert4SpaceTo2Space()
    " convert spaces to tabs first
    set noexpandtab
    set tabstop=4
    set shiftwidth=4
    retab!
    " now you have tabs instead of spaces, so insert spaces according to
    " your new preference
    set tabstop=2
    set shiftwidth=2
    set expandtab
    retab!
endfunction

