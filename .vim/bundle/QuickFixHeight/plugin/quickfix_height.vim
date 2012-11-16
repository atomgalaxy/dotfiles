" ---------------------------------------------------------------------
" Load Once: {{{1
if exists("g:loaded_quickfixheight") || &cp
 finish
endif
let g:loaded_quickfixheight = "v0.1"
" }}}

function! quickfix_height#AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
