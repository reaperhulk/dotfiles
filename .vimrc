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
set cursorline
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ttimeoutlen=50      " set timeout length when hitting escape (prevents pause when leaving insert mode with vim-airline)
set ttyfast
set encoding=utf-8 nobomb
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·
set list
" Show the filename in the window titlebar
set title
filetype off "for some reason vundle needs this off

" Vundle config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" my bundles
" nice statusline
Plugin 'bling/vim-airline'
" syntax checking and such
Plugin 'scrooloose/syntastic'
" ctrl-p for quick searching
Plugin 'kien/ctrlp.vim'
" nerdtree obviously
Plugin 'scrooloose/nerdtree'
" visual indent guides
Plugin 'nathanaelkane/vim-indent-guides'
" git integration
Plugin 'tpope/vim-fugitive'
" buffer explorer
Plugin 'bufexplorer.zip'
" adds better begin/end matching for various blocks
Plugin 'matchit.zip'
" adds leader-leader commenting
Plugin 'tpope/vim-commentary'
" adds gutter for added/changed/deleted lines
Plugin 'airblade/vim-gitgutter'
" ag search (requires ag)
Plugin 'rking/ag.vim'

" rust language support
Plugin 'wting/rust.vim'
" golang support
Plugin 'fatih/vim-go'
" up to date markdown syntax
Plugin 'tpope/vim-markdown'
" clojure stuff
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-leiningen'

" colorscheme bundle
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/Impact'
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
call vundle#end()

" ignore html and so files for ctrl-p
let g:ctrlp_custom_ignore = { 'file': '\.html$\|\.so$', 'dir': 'build\/lib' }

" don't update the gitgutter unless saving a buffer
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" ident guide flags
let g:indent_guides_exclude_filetypes = ['nerdtree']

filetype plugin on      "you can then turn them back on after loading via vundle
filetype plugin indent on

colorscheme impact "cli color scheme

" Turn off the active line underline in terminal
" In terminal the line number does not highlight for some reason
" but it does in gvim/macvim
highlight CursorLine cterm=None

set scrolloff=5 "keep at least 5 lines above/below

let g:indent_guides_enable_on_vim_startup = 1

let g:airline#extensions#hunks#enabled = 0

set autochdir
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
"let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.egg$', '\.egg-info$', '__pycache__']
noremap <C-T> :NERDTreeToggle<CR><C-W>=

nnoremap <leader>rr :call Convert4SpaceTo2Space()<CR>

nmap * :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag<space>

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
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_style_error_symbol="⚠"
let g:syntastic_style_warning_symbol="⚠"
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args=''
let g:syntastic_ruby_checkers = ['mri', 'rubocop']


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
