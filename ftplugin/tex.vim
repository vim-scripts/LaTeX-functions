" Settings {{{
set nowrap
" }}}

" Functions {{{
if(!exists("g:TeX_loaded"))
" TeX main functions {{{
" function! TeXInit() {{{
function! TeXInit()
	if(!exists("g:TeX_loaded"))
		let g:TeX_loaded = 1
	endif
	let b:TeX_ref_buffer = 0
	let b:TeX_bib_buffer = 0
	let b:TeX_bib_file = ""
	let b:TeX_dvips = "dvips"
	let b:TeX_latex = "cslatex"
	let b:TeX_bibtex = "bibtex"
	let b:TeX_vi_bibtex = "vi-bibtex.pl"
	let b:TeX_ps_view = "gv"
	let b:TeX_dvi_view = "xdvi"
	let b:TeX_czech_quotes = 1
endfunction
" }}}
" function! TeXDone() {{{
function! TeXDone()
	let ac_buf = winbufnr(winnr())
	if(b:TeX_ref_buffer != 0)
		exe ":bdelete! ".b:TeX_ref_buffer
		let b:TeX_ref_buffer = 0
	endif
	if(b:TeX_bib_buffer != 0)
		exe ":bdelete! ".b:TeX_bib_buffer
		let b:TeX_bib_buffer = 0
	endif
endfunction
" }}}
" function! TeXCompile() {{{
function! TeXCompile()
	if(filereadable("Makefile"))
		exe ":!make dvi"
	else
		exe ":!".b:TeX_latex." %"
	endif
endfunction
" }}}
" function! TeXCompilePS() {{{
function! TeXCompilePS()
	if(filereadable("Makefile"))
		exe ":!make ps"
	else
		call TeXCompile()
		exe ":!".b:TeX_dvips." ".TeXChangeExt(expand("%"), "dvi")." -o ".TeXChangeExt(expand("%"), "ps")
	endif
endfunction
" }}}
" function! TeXViewDVI() {{{
function! TeXViewDVI()
	if(filereadable("Makefile"))
		exe ":!make view"
	else
		call TeXCompile()
		exe ":!".b:TeX_dvi_view." ".TeXChangeExt(expand("%"), "dvi")
	endif
endfunction
" }}}
" function! TeXViewPS() {{{
function! TeXViewPS()
	if(filereadable("Makefile"))
		exe ":!make viewps"
	else
		call TeXCompilePS()
		exe ":!".b:TeX_ps_view." ".TeXChangeExt(expand("%"), "ps")
	endif
endfunction
" }}}
" }}}
" Enviroment Insert Functions {{{
" function! TeXInsertEnv_figure() {{{
function! TeXInsertEnv_figure()
	call TeXAddArg(input("Position: ", "htbp"), 0)
	exe "normal o"
	call TeXInsertCommand("label", 1)
	exe "normal o"
	call TeXInsertCommand("caption", 1)
	exe "normal kko\<Esc>mzjj"
	return 1
endfunction
" }}}
" function! TeXInsertEnv_table() {{{
function! TeXInsertEnv_table()
	call TeXAddArg(input("Position: ", "htbp"), 0)
	exe "normal o"
	call TeXInsertCommand("label", 1)
	exe "normal o"
	call TeXInsertCommand("caption", 1)
	exe "normal kko\<Esc>mzjjo"
	return 1
endfunction
" }}}
" function! TeXInsertEnv_enumerate() {{{
function! TeXInsertEnv_enumerate()
	call TeXInsertItem()
endfunction
" }}}
" function! TeXInsertEnv_itemize() {{{
function! TeXInsertEnv_itemize()
	call TeXInsertItem()
endfunction
" }}}
" function! TeXInsertEnv_description() {{{
function! TeXInsertEnv_description()
	call TeXInsertItem()
endfunction
" }}}
" function! TeXInsertEnv_array() {{{
function! TeXInsertEnv_array()
	call TeXAddArg(input("Column format: ", ""), 1)
	exe "normal o"
endfunction
" }}}
" function! TeXInsertEnv_tabular() {{{
function! TeXInsertEnv_tabular()
	call TeXAddArg(input("Column format: ", ""), 1)
	exe "normal o"
endfunction
" }}}
" }}}
" Command Insert Functions {{{
" function! TeXInsertCmd_pagestyle() {{{
function! TeXInsertCmd_pagestyle()
	call TeXAddArg(input("Page style: ", ""), 1)
endfunction
" }}}
" function! TeXInsertCmd_bibliographystyle() {{{
function! TeXInsertCmd_bibliographystyle()
	call TeXAddArg(input("Bibliography style: ", ""), 1)
endfunction
" }}}
" function! TeXInsertCmd_label() {{{
function! TeXInsertCmd_label()
	call TeXAddArg(input("Label: ", ""), 1)
endfunction
" }}}
" function! TeXInsertCmd_caption() {{{
function! TeXInsertCmd_caption()
	call TeXAddArg(input("Caption: ", ""), 1)
endfunction
" }}}
" function! TeXInsertCmd_frac() {{{
function! TeXInsertCmd_frac()
endfunction
" }}}
" function! TeXInsertCmd_bibliography() {{{
function! TeXInsertCmd_bibliography()
	call TeXAddArg(input("Bibliography file: ", ""), 1)
endfunction
" }}}
" function! TeXInsertCmd_chapter() {{{
function! TeXInsertCmd_chapter()
	call TeXAddArg(input("Chapter: ", ""), 1)
endfunction
" }}}
" function! TeXInsertCmd_section() {{{
function! TeXInsertCmd_section()
	call TeXAddArg(input("Section: ", ""), 1)
endfunction
" }}}
" function! TeXInsertCmd_subsection() {{{
function! TeXInsertCmd_subsection()
	call TeXAddArg(input("Subsection: ", ""), 1)
endfunction
" }}}
" function! TeXInsertCmd_subsubsection() {{{
function! TeXInsertCmd_subsubsection()
	call TeXAddArg(input("Subsubsection: ", ""), 1)
endfunction
" }}}
" function! TeXInsertCmd_paragraph() {{{
function! TeXInsertCmd_paragraph()
	call TeXAddArg(input("Paragraph: ", ""), 1)
endfunction
" }}}
" function! TeXInsertCmd_subparagraph() {{{
function! TeXInsertCmd_subparagraph()
	call TeXAddArg(input("SubpParagraph: ", ""), 1)
endfunction
" }}}
" }}}
" Item Insert Functions {{{
" function! TeXItemFor_enumerate() {{{
function! TeXItemFor_enumerate()
	exe "normal o"
	call TeXInsertCommand("item", 0)
endfunction
" }}}
" function! TeXItemFor_itemize() {{{
function! TeXItemFor_itemize()
	exe "normal o"
	call TeXInsertCommand("item", 0)
endfunction
" }}}
" function! TeXItemFor_description() {{{
function! TeXItemFor_description()
	exe "normal o"
	call TeXInsertCommand("item", 0)
	call TeXAddArg(input("Description: ", ""), 0)
endfunction
" }}}
" function! TeXArrayItem() {{{
function! TeXArrayItem()
	let cols = TeXGetEnvFirstArg()
	let n_cols = TeXArrayColumns(cols)
	let ac_cols = TeXCountElements()
	if(ac_cols == n_cols)
		exe "normal `za \\\\\<CR>"
	else
		exe "normal `za & "
	endif
endfunction
" }}}
" function! TeXEqnArrayItem() {{{
function! TeXEqnArrayItem()
	let cols = TeXGetEnvFirstArg()
	let ac_cols = TeXCountElements()
	if(ac_cols == 3)
		exe "normal `za \\\\\<CR>"
	else
		exe "normal `za & "
	endif
endfunction
" }}}
" function! TeXItemFor_array() {{{
function! TeXItemFor_array()
	call TeXArrayItem()
endfunction
" }}}
" function! TeXItemFor_tabular() {{{
function! TeXItemFor_tabular()
	call TeXArrayItem()
endfunction
" }}}
" function! TeXItemFor_eqnarray() {{{
function! TeXItemFor_eqnarray()
	call TeXArrayItem()
endfunction
" }}}
" function! TeXItemFor_eqnarray_star() {{{
function! TeXItemFor_eqnarray_star()
	call TeXArrayItem()
endfunction
" }}}
" }}}
" Reference Functions {{{
" Dont use AutoClose = 0 in TeXRefList
" function! TeXRefScan() {{{
function! TeXRefScan()
	let ac_buf = winbufnr(winnr())
	if(b:TeX_ref_buffer != 0)
		let ref_buffer = b:TeX_ref_buffer
		exe ":buffer ".b:TeX_ref_buffer
		exe "normal ggdG"
	else
		exe ":new"
		exe ":set bufhidden=hide"
		exe ":set buftype=nofile"
		exe ":set noswapfile"
		call TeXRefBufferInit(ac_buf, 0)
		let ref_buffer = winbufnr(winnr())
		exe ":hide"
	endif
	exe ":buffer ".ac_buf
	exe "normal mzgg"
	let line = search("\\\\label{.*}", "W")
	while(line > 0)
		exe "normal ms"
		let label = matchstr(getline(line), "\\\\label{.*}", col(".") - 1)
		let ltext = substitute(label, "\\\\label{\\(.*\\)}", "\\1", "")
		" perform some identification
		if(ltext != "")
			exe ":buffer ".ref_buffer
			exe "normal o".ltext
			exe ":buffer ".ac_buf
		endif
		let line = search("\\\\label{.*}", "W")
	endwhile
	let b:TeX_ref_buffer = ref_buffer
	exe "normal `z"
endfunction
" }}}
" function! TeXRefSelect(ref) {{{
function! TeXRefSelect(ref)
	let source_buf = b:TeX_source_buf
	let last = TeXRefAutoClose(winbufnr(winnr()))
	exe ":buffer ".source_buf
	if(a:ref != "")
		call TeXInsertCommand("ref", 0)
		call TeXAddArg(a:ref, 1)
	endif
	exe ":buffer ".last
endfunction
" }}}
" function! TeXRefAutoClose(buf_nr) {{{
function! TeXRefAutoClose(buf_nr)
	exe ":buffer ".a:buf_nr
	let source_buf = b:TeX_source_buf
	if(b:TeX_ref_autoclose == 1)
		let result = source_buf
		exe ":bdelete! ".a:buf_nr
	else
		let result = a:buf_nr
	endif
	exe ":buffer ".source_buf
	return result
endfunction
" }}}
" function! TeXRefBufferInit(source_buf, autoclose) {{{
function! TeXRefBufferInit(source_buf, autoclose)
	let b:TeX_ref_autoclose = a:autoclose
	let b:TeX_source_buf = a:source_buf
	exe ":map <buffer> <CR> :call TeXRefSelect(getline(line(\".\")))<CR>"
endfunction
" }}}
" function! TeXRefUp() {{{
function! TeXRefUp()
	call cursor(line(".")-1, 1)
	exe ":match Statement \"^".getline(line("."))."$\""
endfunction
" }}}
" function! TeXRefDown() {{{
function! TeXRefDown()
	call cursor(line(".")+1, 1)
	exe ":match Statement \"^".getline(line("."))."$\""
endfunction
" }}}
" function! TeXRefList(ref) {{{
function! TeXRefList(ref, autoclose)
	if(b:TeX_ref_buffer == 0)
		call TeXRefScan()
	endif
	let ac_buf = winbufnr(winnr())
	let ref_buf = b:TeX_ref_buffer
	exe ":new"
	exe ":set bufhidden=hide"
	exe ":set buftype=nofile"
	exe ":set noswapfile"
	call TeXRefBufferInit(ac_buf, a:autoclose)
	let tmp_buf = winbufnr(winnr())
	let line = 1
	let n = 0
	exe ":buffer ".ref_buf
	exe "normal gg"
	while(line > 0)
		exe ":buffer ".ref_buf
		let line = search(a:ref, "W")
		if(line > 0)
			exe "normal yy"
			exe ":buffer ".tmp_buf
			exe "normal p"
			let n = n + 1
		endif
	endwhile
	exe ":buffer ".tmp_buf
	if(n <= 1)
		if(n == 0)
			echo "No label defined."
			let result = ""
		else
			let result = getline(2)
		endif
		exe ":bdelete! ".tmp_buf
		exe ":buffer ".ac_buf
	else
		let result = ""
		exe ":match keyword Statement \"^".getline(line("."))."$\""
		exe ":map <buffer> j :call TeXRefDown()<CR>"
		exe ":map <buffer> <Down> :call TeXRefDown()<CR>"
		exe ":map <buffer> k :call TeXRefUp()<CR>"
		exe ":map <buffer> <Up> :call TeXRefUp()<CR>"
	endif
	return result
endfunction
" }}}
" function! TeXInsertRef() {{{
function! TeXInsertRef()
	let ref = TeXRefList(input("Reference: ", ""), 1)
	if(ref != "")
		call TeXInsertCommand("ref", 0)
		call TeXAddArg(ref, 1)
	endif
endfunction
" }}}
" }}}
" Bibliography Functions {{{
" function! TeXBibDown() {{{
function! TeXBibDown()
	let l = search("^\"[^\"]*\"", "W")
	if(l > 0)
		exe ":match Statement \"".substitute(getline(line(".")), "\"\\([^\"]*\\)\".*", "\\1", "")."\""
	endif
endfunction
" }}}
" function! TeXBibUp() {{{
function! TeXBibUp()
	let l = search("^\"[^\"]*\"", "bW")
	if(l > 0)
		exe ":match Statement \"".substitute(getline(line(".")), "\"\\([^\"]*\\)\".*", "\\1", "")."\""
	endif
endfunction
" }}}
" function! TeXBibliographyRead(bib_file) {{{
function! TeXBibliographyRead(bib_file)
	if(executable(b:TeX_vi_bibtex) && filereadable(a:bib_file))
		let vi_bibtex = b:TeX_vi_bibtex
		exe ":new"
		let cite_buf = winbufnr(winnr())
		exe ":set bufhidden=hide"
		exe ":set buftype=nofile"
		exe ":set noswapfile"
		exe ":r !".vi_bibtex." ".a:bib_file
		exe "normal ggdd"
		exe ":match Statement \"".substitute(getline(line(".")), "\"\\([^\"]*\\)\".*", "\\1", "")."\""
		exe ":nmap <buffer> j :call TeXBibDown()<CR>"
		exe ":nmap <buffer> <Down> :call TeXBibDown()<CR>"
		exe ":map! <buffer> <Down> <Esc>:call TeXBibDown()<CR>"
		exe ":nmap <buffer> k :call TeXBibUp()<CR>"
		exe ":nmap <buffer> <Up> :call TeXBibUp()<CR>"
		exe ":map! <buffer> <Up> <Esc>:call TeXBibUp()<CR>"
		exe ":hide"
		let b:TeX_bib_buffer = cite_buf
	endif
endfunction
" }}}
" function! TeXBibliographySelect(cite) {{{
function! TeXBibliographySelect(cite)
	let source_buf = b:TeX_source_buf
	exe ":bdelete! ".winbufnr(winnr())
	exe ":buffer ".source_buf
	if(a:cite != "")
		let cite = substitute(a:cite, "^\"\\([^\"]*\\)\".*", "\\1", "")
		call TeXInsertCommand("cite", 0)
		call TeXAddArg(cite, 1)
	endif
endfunction
" }}}
" function! TeXBibliographyList(cite) {{{
function! TeXBibliographyList(cite)
	if(b:TeX_bib_buffer == 0)
		call TeXScanBibliography()
		if(b:TeX_bib_buffer == 0)
			return ""
		endif
	endif
	let ac_buf = winbufnr(winnr())
	let cite_buf = b:TeX_bib_buffer
	exe ":new"
	exe ":set bufhidden=hide"
	exe ":set buftype=nofile"
	exe ":set noswapfile"
	let b:TeX_source_buf = ac_buf
	let tmp_buf = winbufnr(winnr())
	exe ":buffer ".cite_buf
	exe "normal G"
	let line = 1
	let n = 0
	while(line > 0)
		exe ":buffer ".cite_buf
		let line = search("^\".*".a:cite.".*\"", "bW")
		if(line > 0)
			exe "normal y/^$/\<CR>"
			let cite_line = getline(line("."))
			exe ":buffer ".tmp_buf
			exe "normal Gp"
			let n = n + 1
		endif
	endwhile
	exe ":buffer ".tmp_buf
	if(n <= 1)
		exe ":bdelete! ".tmp_buf
		exe ":buffer ".ac_buf
		if(n == 0)
			return ""
		else
			return cite_line
		endif
	else
		exe "normal ggdd"
		exe ":match Statement \"".substitute(getline(line(".")), "\"\\([^\"]*\\)\".*", "\\1", "")."\""
		exe ":nmap <buffer> j :call TeXBibDown()<CR>"
		exe ":nmap <buffer> <Down> :call TeXBibDown()<CR>"
		exe ":map! <buffer> <Down> <Esc>:call TeXBibDown()<CR>"
		exe ":nmap <buffer> k :call TeXBibUp()<CR>"
		exe ":nmap <buffer> <Up> :call TeXBibUp()<CR>"
		exe ":map! <buffer> <Up> <Esc>:call TeXBibUp()<CR>"
		exe ":map <buffer> <CR> :call TeXBibliographySelect(getline(line(\".\")))<CR>"
		return ""
	endif
endfunction
" }}}
" function! TeXInsertBibliography() {{{
function! TeXInsertBibliography()
	let cite = TeXBibliographyList(input("Cite: ", ""))
	if(cite != "")
		let cite = substitute(a:cite, "^\"\\([^\"]*\\)\".*", "\\1", "")
		call TeXInsertCommand("cite", 0)
		call TeXAddArg(cite, 1)
	endif
endfunction
" }}}
" function! TeXGetBibliography() {{{
function! TeXGetBibliography()
	exe "normal mzgg"
	let line = search("\\\\bibliography{[^}]*}", "W")
	let bib = substitute(matchstr(getline(line(".")), "\\\\bibliography{[^}]*}",0), "\\\\bibliography{\\([^}]*\\)}", "\\1", "")
	exe "normal `z"
	if(bib != "")
		return bib.".bib"
	else
		return ""
	endif
endfunction
" }}}
" function! TeXScanBibliography() {{{
function! TeXScanBibliography()
	if(b:TeX_bib_file == "")
		let b:TeX_bib_file = TeXGetBibliography()
		if(b:TeX_bib_file == "")
			let bib_file = input("Bibliography file:", "")
			if(bib_file != "")
				exe "normal mzgg"
				let line = search("\\\\appendix", "W")
				if(line == 0)
					let line = search("\\\\end{document}")
				endif
				exe "normal O"
				call TeXInsertCommand("bibliography", 0)
				call TeXAddArg(bib_file, 1)
				exe "normal `z"
				let b:TeX_bib_file = TeXGetBibliography()
			endif
		endif
	endif
	if(b:TeX_bib_file != "")
		call TeXBibliographyRead(b:TeX_bib_file)
	endif
endfunction
" }}}
" }}}
" Misc. Functions {{{
" function! TeXGetEnvFirstArg() {{{
function! TeXGetEnvFirstArg()
	if(TeXMarkEnviroment() == 1)
		exe "normal `x"
		let arg = substitute(matchstr(getline(line(".")), "\\\\begin{[^}]*}[^{]*{[^}]*}", 0), "\\\\begin{[^}]*}[^{]*{\\(.*\\)}", "\\1", "")
		return arg
	else
		return ""
	endif
endfunction
" }}}
" function! TeXArrayColumns(columns) {{{
function! TeXArrayColumns(columns)
	let c = substitute(a:columns, "|", "", "g")
	let c = substitute(c, "{[^}]*}", "", "g")
	return strlen(c)
endfunction
" }}}
" function! TeXCountElements() {{{
function! TeXCountElements()
	exe "normal `z"
	let line = 1
	let inner = 0
	let n = 1
	while(line > 0)
		let line = search("&\\|\\\\\\\\\\|\\\\begin\\|\\\\end", "bW")
		if(line > 0)
			let element = matchstr(getline(line(".")), "&\\|\\\\\\\\\\|\\\\begin\\|\\\\end", col(".") - 1)
			if(element == "\\begin")
				if(inner == 0)
					break
				endif
				let inner = inner - 1
			endif
			if(element == "\\end")
				let inner = inner + 1
			endif
			if(element == "\\\\" && inner == 0)
				break
			endif
			if(element == "&" && inner == 0)
				let n = n + 1
			endif
		endif
	endwhile
	return n
endfunction
" }}}
" function! TeXComment() {{{
function! TeXComment()
	exe ":s/\\(.*\\)/%% \\1/"
endfunction
" }}}
" function! TeXUncomment() {{{
function! TeXUncomment()
	exe ":silent! s/%% \\(.*\\)/\\1/"
endfunction
" }}}
" function! TeXFoldEnviroment() {{{
function! TeXFoldEnviroment()
	if(TeXMarkEnviroment() == 1)
		exe "normal `yyyp:s/\\(.*\\)/%% \\1 \}\}\}/\<CR>"
		exe "normal `xyyP:s/\\(.*\\)/%% \\1 \{\{\{/\<CR>"
	endif
endfunction
" }}}
" }}}
" Font Functions {{{
" function! TeXInsertFont(font) {{{
function! TeXInsertFont(font)
	exe "normal a{\\".a:font." }\<Esc>h"
endfunction
" }}}
" function! TeXDeleteFont() {{{
function! TeXDeleteFont()
	if(TeXMarkArg() == 1)
		exe "normal `xl"
		let line = search("{\\\\[a-zA-Z]* ", "bW")
		if(line == line("'x") && col(".") == col("'x"))
			exe "normal `yx`xd/ /\<CR>`xx"
		endif
	endif
	exe "normal `z"
endfunction
" }}}
" function! TeXChangeFont(new_font) {{{
function! TeXChangeFont(new_font)
	if(TeXMarkArg() == 1)
		exe "normal `xl"
		let line = search("{\\\\[a-zA-Z]* ", "bW")
		if(line == line("'x") && col(".") == col("'x"))
			exe "normal `x"
			exe ":s/{\\\\[a-zA-Z]* /{\\\\".a:new_font." /"
			exe "normal `x"
		endif
	endif
endfunction
" }}}
" function! TeXVisualFont(font) range {{{
function! TeXVisualFont(font) range
	call cursor(line("'>"), col("'>"))
	exe "normal a}"
	call cursor(line("'<"), col("'<"))
	exe "normal i{\\".a:font." "
endfunction
" }}}
" }}}
" function! TeXAddArg(value, need) {{{
function! TeXAddArg(value, need)
	exe "normal `y"
	if(a:need == 1)
		exe "normal a{".a:value."}\<Esc>my"
	else
		exe "normal a[".a:value."]\<Esc>my"
	endif
endfunction
" }}}
" function! TeXChangeExt(name, ext) {{{
function! TeXChangeExt(name, ext)
	let name = substitute(a:name, "\.[a-zA-Z0-9_]*$", "\.".a:ext, "")
	return name
endfunction
" }}}
" function! TeXCreateMakefile() {{{
function! TeXCreateMakefile()
	if(!filereadable("Makefile"))
		let name = expand("%")
		exe ":new Makefile"
		exe "normal ialb: dvi ps\<CR>\<CR>"
		exe "normal idvi: ".name."\<CR>"
		exe "normal i\t".b:TeX_latex." ".name."\<CR>\<CR>"
		exe "normal ips: ".TeXChangeExt(name, "dvi")."\<CR>"
		exe "normal i\t".b:TeX_dvips." ".TeXChangeExt(name, "dvi")." ".TeXChangeExt(name, "ps")."\<CR>\<CR>"
		exe "normal iviewps: ps\<CR>"
		exe "normal i\t".b:TeX_ps_view." ".TeXChangeExt(name, "ps")."\<CR>\<CR>"
		exe "normal iview: dvi\<CR>"
		exe "normal i\t".b:TeX_dvi_view." ".TeXChangeExt(name, "dvi")."\<CR>\<CR>"
		exe ":wq"
	endif
endfunction
" }}}
" function! TeXInsertEnviroment(env) {{{
function! TeXInsertEnviroment(env)
	if(a:env != "")
		exe "normal o\\begin{".a:env."}\<Esc>my"
		let env_name = substitute(a:env, "\*", "_star", "g")
		if(exists("*TeXInsertEnv_".env_name))
			if(TeXInsertEnv_{env_name}() == 0)
				exe "normal mz"
			endif
		else
			exe "normal A\<CR>\<Esc>mz"
		endif
		exe "normal o\\end{".a:env."}\<Esc>`z"
	endif
endfunction
" }}}
" function! TeXInsertCommand(cmd) {{{
function! TeXInsertCommand(cmd, ask_args)
	if(a:cmd != "")
		exe "normal a\\".a:cmd."\<Esc>mya \<Esc>mz"
		let cmd_name = substitute(a:cmd, "\*", "_star", "g")
		if(a:ask_args == 1)
			if(exists("*TeXInsertCmd_".cmd_name))
				call TeXInsertCmd_{cmd_name}()
			endif
		endif
		exe "normal 'z"
	endif
endfunction
" }}}
" function! TeXMarkEnviroment() {{{
function! TeXMarkEnviroment()
	let found = 0
	let sc = col(".") + 1
	exe "normal mz$"
	let start = line(".")
	let line = search("\\\\begin{[^}]*}", "bW")
	while(line > 0)
		exe "normal mx"
		let l = searchpair("\\\\begin{[^}]*}", "", "\\\\end{[^}]*}", "W")
		let tmp = matchstr(getline(line(".")), "\\\\end{[^}]*}", 0)
		if(l < start || (l == start && sc > col(".") + strlen(tmp)))
			if(l <= 0)
				exe "normal `z"
				return 0
			endif
			exe "normal `x"
			let line = search("\\\\begin{[^}]*}", "bW")
			if(line == 0)
				exe "normal `z"
				return 0
			endif
		else
			exe "normal my`z"
			return 1 
		endif
	endwhile
	exe "normal `z"
	return 0
endfunction
" }}}
" function! TeXGetEnv() {{{
function! TeXGetEnv()
	if(TeXMarkEnviroment() == 1)
		return substitute(getline(line("'x")), ".*\\\\begin{\\([^}]*\\)}.*", "\\1", "")
	else
		return ""
	endif
endfunction
" }}}
" function! TeXRenameEnviroment(new_env) {{{
function! TeXRenameEnviroment(new_env)
	if(TeXMarkEnviroment() == 1)
		let a = setline(line("'x"), substitute(getline(line("'x")), "\\(.*\\\\begin{\\).*\\(}.*\\)", "\\1".a:new_env."\\2", ""))
		let a = setline(line("'y"), substitute(getline(line("'y")), "\\(.*\\\\end{\\).*\\(}.*\\)", "\\1".a:new_env."\\2", ""))
	endif
endfunction
" }}}
" function! TeXInsertItem() {{{
function! TeXInsertItem()
	let env = TeXGetEnv()
	if(env == "")
		exe "normal a\<CR>"
	else
		if(exists("*TeXItemFor_".env))
			call TeXItemFor_{env}()
		else
			exe "normal a\\\\\<CR>"
			echo env
		endif
	endif
endfunction
" }}}
" function! TeXMarkArg() {{{
function! TeXMarkArg()
	let sc = col(".")
	let sl = line(".")
	exe "normal mzl"
	let found = 0
	while(!found) 
		let lsl = search("[{\[]", "bW")
		exe "normal mx"
		let lsc = col(".")
		if(lsl > 0)
			exe "normal %"
			let lel = line(".")
			let lec = col(".")
			if(lel == sl)
				if(lec > sc)
					let found = 1
				else
					exe "normal `x"
				endif
			else
				if(lel > sl)
					let found = 1
				else
					exe "normal `x"
				endif
			endif
		else
			exe "normal `z"
			return 0
		endif
	endwhile
	exe "normal my`z"
	return 1
endfunction
" }}}
" function! TeXMarkNextArg() {{{
function! TeXMarkNextArg()
	let found = 0
	exe "normal `yl%%"
	if(col("'y") + 1 == col(".") && line("'y") == line("."))
		exe "normal mx%my"
		let found = 1
	endif
	exe "normal `z"
	return found
endfunction
" }}}
" function! TeXMarkPrevArg() {{{
function! TeXMarkPrevArg()
	let found = 0
	exe "normal `xh%"
	if(col("'y") != col(".") || line("'y") != line("."))
		exe "normal mx%my"
		let found = 1
	endif
	exe "normal `z"
	return found
endfunction
" }}}
" function! TeXArgNum() {{{
function! TeXArgNum()
	if(TeXMarkArg() == 1)
		exe "normal `xmt`yms"
		let n = 1
		while(TeXMarkPrevArg() == 1)
			let n = n + 1
		endwhile
		exe "normal `tmx`smy"
		return n
	else
		return 0
	endif
endfunction
" }}}
" function! TeXDeleteArg() {{{
function! TeXDeleteArg()
	if(TeXMarkArg() == 1)
		exe "normal `xd`yx"
	endif
endfunction
" }}}
" function! TeXDeleteArgValue() {{{
function! TeXDeleteArgValue()
	if(TeXMarkArg() == 1)
		exe "normal `xld/[}\\]]/\<CR>"
	endif
endfunction
" }}}
" function! TeXChangeArgValue(value) {{{
function! TeXChangeArgValue(value)
	if(TeXMarkArg() == 1)
		exe "normal `xld/[}\\]]/\<CR>"
		exe "normal `xa".a:value
	endif
endfunction
" }}}
" function! TeXDeleteEnviroment() {{{
function! TeXDeleteEnviroment()
	if(TeXMarkEnviroment() == 1)
		exe ":".line("'x").",".line("'y")."d"
	endif
endfunction
" }}}
" function! TeXAddNewArg(value, need) {{{
function! TeXAddNewArg(value, need)
	if(TeXMarkArg() == 1)
		while(TeXMarkNextArg() == 1)
		endwhile
	else
		exe "normal bmy"
	endif
	call TeXAddArg(a:value, a:need)
endfunction
" }}}
" function! TexQuotes() {{{
" Smart quotes.  Thanks to Ron Aaron <ron@mossbayeng.com>.
" Changed for Czech quotes by Karel Vaigl.
function! TeXQuotes()
	if(b:TeX_czech_quotes == 1)
    	let insert = "``"
	else
		let insert = "''"
	endif
    let left = getline(line("."))[col(".")-2]
    if left =~ '^\(\|\s\)$'
		if(b:TeX_czech_quotes == 1)
    		let insert = ',,'
		else
			let insert = '``'
		endif
    elseif left == '\'
    let insert = '"'
    endif
    return insert
endfunction
inoremap " <C-R>=TeXQuotes()<CR>
" }}}
" function! TeXDoubleAmpersand() {{{
function! TeXDoubleAmpersands()
	let env = TeXGetEnv()
	if(env == "array")
		return "&"
	else
		return "&&"
	endif
endfunction
inoremap & <C-R>=TeXDoubleAmpersands()<CR>
" }}}
endif
" }}}

" Initialization {{{
call TeXInit()

source tex.keybindings.vim
source tex.menu.vim
" }}}
