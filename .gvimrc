set go-=T
set transparency=10
set background=dark
colorscheme solarized
" We only use a powerline font in macvim, so this is disabled
" in vimrc and enabled in gvimrc
let g:airline_powerline_fonts=1
" make the solarized sign column the same as the line number
highlight SignColumn guibg=#073642
" vim-gitgutter will use Sign Column to set its color, reload it.
call gitgutter#highlight#define_highlights()
" make the background color black
highlight Normal guibg=black
" set gfn:Inconsolata\ for\ Powerline:h14
set gfn:Hack:h12
set noballooneval       "disables tooltips hooray

augroup NerdCursor
  autocmd!
  autocmd BufEnter NERD_tree_* hi CursorLine guibg=#073642
  autocmd BufLeave NERD_tree_* highlight clear CursorLine
  autocmd BufAdd * highlight clear CursorLine
augroup END
augroup BufExpCursor
  autocmd!
  autocmd BufEnter \[BufExplorer\] hi CursorLine guibg=#073642
  autocmd BufLeave \[BufExplorer\] highlight clear CursorLine
  autocmd BufAdd * highlight clear CursorLine
augroup END
