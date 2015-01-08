"Hide menus and other widgets
set guioptions-=m  "Remove menu bar
set guioptions-=T  "Remove toolbar
set guioptions-=r  "Remove right-hand scrollbar
set guioptions-=L  "Remove left-hand scrollbar
set guioptions+=c  "Hide dialogs
set guioptions-=e  "Don't show ugly GVIM tabbar, but use VIM-style  aaah

set guifont=Monospace\ 9

"Toggling the display of a widget
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

set t_vb=  "Don't flash on errors
