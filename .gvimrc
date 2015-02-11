set go-=T
set transparency=10
set background=dark
colorscheme solarized
" make the solarized sign column the same as the line number
highlight SignColumn guibg=#073642
" vim-gitgutter will use Sign Column to set its color, reload it.
call gitgutter#highlight#define_highlights()
" make the background color black
highlight Normal guibg=black
set gfn:Inconsolata\ for\ Powerline:h14
set noballooneval       "disables tooltips hooray
