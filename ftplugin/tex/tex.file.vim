" Define function prefix {{{
let b:VIM_function_prefix = "TeX"
" }}}

" Function for reading template {{{
function! TeXTemplate()
	call ReadTemplate("tex")
endfunction
" }}}
