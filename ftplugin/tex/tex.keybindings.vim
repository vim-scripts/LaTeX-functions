" Key bindings for LaTeX editing macros.

" Key Mappings {{{
if(has("gui_running"))
" Mappings for GUI {{{
	map <M-CR>		:call TeXInsertItem()<CR>
	map! <M-CR>		<Esc>:call TeXInsertItem()<CR>a
	map <C-Left>	:call TeXMarkArg()<CR>:call TeXMarkPrevArg()<CR>`x
	map! <C-Left>	<Esc>:call TeXMarkArg()<CR>:call TeXMarkPrevArg()<CR>`xa
	map <C-Right>	:call TeXMarkArg()<CR>:call TeXMarkNextArg()<CR>`x
	map! <C-Right>	<Esc>:call TeXMarkArg()<CR>:call TeXMarkNextArg()<CR>`xa
	map <C-Delete>	:call TeXMarkArg()<CR>:call TeXDeleteArgValue()<CR>
	map! <C-Delete>	<Esc>:call TeXMarkArg()<CR>:call TeXDeleteArgValue()<CR>i
" }}}
else
" Mappings for console {{{
	map <C-E>		:call TeXInsertItem()<CR>
	map! <C-E>		<Esc>:call TeXInsertItem()<CR>a
	map <C-A>h		:call TeXMarkArg()<CR>:call TeXMarkPrevArg()<CR>`x
	map! <C-A>h		<Esc>:call TeXMarkArg()<CR>:call TeXMarkPrevArg()<CR>`xa
	map <C-A>l		:call TeXMarkArg()<CR>:call TeXMarkNextArg()<CR>`x
	map! <C-A>l		<Esc>:call TeXMarkArg()<CR>:call TeXMarkNextArg()<CR>`xa
	map <C-A>d		:call TeXMarkArg()<CR>:call TeXDeleteArgValue()<CR>
	map! <C-A>d		<Esc>:call TeXMarkArg()<CR>:call TeXDeleteArgValue()<CR>i
" }}}
endif
" Mappings for Font changing {{{
" Font Insert
map <C-F>b			:call TeXInsertFont("bf")<CR>
map! <C-F>b			<Esc>:call TeXInsertFont("bf")<CR>a
map <C-F>i			:call TeXInsertFont("it")<CR>
map! <C-F>i			<Esc>:call TeXInsertFont("it")<CR>a
map <C-F>t			:call TeXInsertFont("tt")<CR>
map! <C-F>t			<Esc>:call TeXInsertFont("tt")<CR>a
map <C-F>e			:call TeXInsertFont("em")<CR>
map! <C-F>e			<Esc>:call TeXInsertFont("em")<CR>a
map <C-F>l			:call TeXInsertFont("large")<CR>
map! <C-F>l			<Esc>:call TeXInsertFont("large")<CR>a
map <C-F>L			:call TeXInsertFont("Large")<CR>
map! <C-F>L			<Esc>:call TeXInsertFont("Large")<CR>a
map <C-F>s			:call TeXInsertFont("small")<CR>
map! <C-F>s			<Esc>:call TeXInsertFont("small")<CR>a
map <C-F>S			:call TeXInsertFont("Small")<CR>
map! <C-F>S			<Esc>:call TeXInsertFont("Small")<CR>a
map <C-F>h			:call TeXInsertFont("huge")<CR>
map! <C-F>h			<Esc>:call TeXInsertFont("huge")<CR>a
map <C-F>H			:call TeXInsertFont("Huge")<CR>
map! <C-F>H			<Esc>:call TeXInsertFont("Huge")<CR>a
" Font change
map <C-F>cb			:call TeXChangeFont("bf")<CR>
map! <C-F>cb		<Esc>:call TeXChangeFont("bf")<CR>a
map <C-F>ci			:call TeXChangeFont("it")<CR>
map! <C-F>ci		<Esc>:call TeXChangeFont("it")<CR>a
map <C-F>ct			:call TeXChangeFont("tt")<CR>
map! <C-F>ct		<Esc>:call TeXChangeFont("tt")<CR>a
map <C-F>ce			:call TeXChangeFont("em")<CR>
map! <C-F>ce		<Esc>:call TeXChangeFont("em")<CR>a
map <C-F>cl			:call TeXChangeFont("large")<CR>
map! <C-F>cl		<Esc>:call TeXChangeFont("large")<CR>a
map <C-F>cL			:call TeXChangeFont("Large")<CR>
map! <C-F>cL		<Esc>:call TeXChangeFont("Large")<CR>a
map <C-F>cs			:call TeXChangeFont("small")<CR>
map! <C-F>cs		<Esc>:call TeXChangeFont("small")<CR>a
map <C-F>cS			:call TeXChangeFont("Small")<CR>
map! <C-F>cS		<Esc>:call TeXChangeFont("Small")<CR>a
map <C-F>ch			:call TeXChangeFont("huge")<CR>
map! <C-F>ch		<Esc>:call TeXChangeFont("huge")<CR>a
map <C-F>cH			:call TeXChangeFont("Huge")<CR>
map! <C-F>cH		<Esc>:call TeXChangeFont("Huge")<CR>a
" Visual Font
vmap <C-F>b			:call TeXVisualFont("bf")<CR>
vmap <C-F>i			:call TeXVisualFont("it")<CR>
vmap <C-F>t			:call TeXVisualFont("tt")<CR>
vmap <C-F>e			:call TeXVisualFont("em")<CR>
vmap <C-F>l			:call TeXVisualFont("large")<CR>
vmap <C-F>L			:call TeXVisualFont("Large")<CR>
vmap <C-F>s			:call TeXVisualFont("small")<CR>
vmap <C-F>S			:call TeXVisualFont("Small")<CR>
vmap <C-F>h			:call TeXVisualFont("huge")<CR>
vmap <C-F>H			:call TeXVisualFont("Huge")<CR>
" Font delete
map <C-F>d			:call TeXDeleteFont()<CR>
map! <C-F>d			<Esc>:call TeXDeleteFont()<CR>a
" }}}
" Mappings for Console/GUI {{{
" Enviroment Insert Mappings {{{
map <C-H>E			:call TeXInsertEnviroment(input("Enviroment: ", ""))<CR>
map <C-H>ee			call TeXInsertEnviroment("equation")<CR>
map! <C-H>ee		<Esc>:call TeXInsertEnviroment("equation")<CR>a
map <C-H>ef			call TeXInsertEnviroment("figure")<CR>
map <C-H>et			call TeXInsertEnviroment("table")<CR>
map <C-H>ea			call TeXInsertEnviroment("array")<CR>
map <C-H>eb			call TeXInsertEnviroment("tabular")<CR>
map <C-H>eq			call TeXInsertEnviroment("eqnarray")<CR>
map! <C-H>eq		<Esc>:call TeXInsertEnviroment("eqnarray")<CR>a
map <C-H>eg			call TeXInsertEnviroment("tabbing")<CR>
map! <C-H>eg		<Esc>:call TeXInsertEnviroment("tabbing")<CR>a
map <C-H>em			call TeXInsertEnviroment("displaymath")<CR>
map! <C-H>em		<Esc>:call TeXInsertEnviroment("displaymath")<CR>a
" }}}
map <C-H>f			:call TeXFoldEnviroment()<CR>
map <C-H>d			:call TeXDeleteEnviroment()<CR>
map! <C-H>d			<Esc>:call TeXDeleteEnviroment()<CR>a
map <C-H>C			:call TeXRenameEnviroment(input("New Enviroment: ", ""))<CR>
map <C-H>r			:call TeXInsertRef()<CR>
map <C-H>i			:call TeXInsertBibliography()<CR>
map <C-H>m			:call TeXInsertCommand(input("Command: ", ""), 1)<CR>
" }}}
" Greek letters mappings, borrowed from vim filetype plugin from Carl Mueller, cmlr@math.rochester.edu {{{
inoremap `` ``
inoremap `a \alpha
inoremap `b \beta
inoremap `c \chi
inoremap `d \delta
inoremap `e \varepsilon
inoremap `f \varphi
inoremap `g \gamma
inoremap `h \eta
inoremap `i \in
" Or \iota or \infty or \in
inoremap `k \kappa
inoremap `l \lambda
inoremap `m \mu
inoremap `n \nu
inoremap `o \omega
inoremap `p \pi
inoremap `q \theta
inoremap `r \rho
inoremap `s \sigma
inoremap `t \tau
inoremap `u \upsilon
inoremap `v \vee
inoremap `w \wedge
inoremap `x \xi
inoremap `y \psi
inoremap `z \zeta
inoremap `D \Delta
inoremap `I \int_{}^{}<Esc>3hi
inoremap `F \Phi
inoremap `G \Gamma
inoremap `L \Lambda
inoremap `N \nabla
inoremap `O \Omega
inoremap `Q \Theta
inoremap `R \varrho
inoremap `S \sum_{}^{}<Esc>3hi
inoremap `U \Upsilon
inoremap `X \Xi
inoremap `Y \Psi
inoremap `0 \emptyset
inoremap `1 \left
inoremap `2 \right
inoremap `3 \Big
inoremap `6 \partial
inoremap `8 \infty
inoremap `/ \frac{}{}<Esc>2hi
inoremap `% \frac{}{}<Esc>2hi
inoremap `@ \circ
inoremap `\| \Big\|
inoremap `= \equiv
inoremap `\ \setminus
inoremap `. \cdot
inoremap `* \times
inoremap `& \wedge
inoremap `- \bigcap
inoremap `+ \bigcup
inoremap `( \subset
inoremap `) \supset
inoremap `< \le
inoremap `> \ge
inoremap `, \nonumber
inoremap `: \dots
inoremap `~ \tilde^V{}<Left>
inoremap `^ \hat^V{}<Left>
inoremap `; \dot^V{}<Left>
inoremap `_ \bar^V{}<Left>
inoremap `<M-c> \cos
inoremap `<C-E> \exp\left(\right)<Esc>6hi
inoremap `<C-I> \in
inoremap `<C-J> \downarrow
inoremap `<C-L> \log
inoremap `<C-P> \uparrow
inoremap `<Up> \uparrow
inoremap `<C-N> \downarrow
inoremap `<Down> \downarrow
inoremap `<C-F> \to
inoremap `<Right> \lim_{}<Left>
inoremap `<C-S> \sin
inoremap `<C-T> \tan
inoremap `<M-l> \ell
inoremap `<CR> \nonumber\\<CR><HOME>&&<Left>
" }}}
" Citation, Reference mappings {{{
map <Leader>ri	:call TeXInsertRef()<CR>
map <Leader>rr	:call TeXRefScan()<CR>
map <Leader>ci	:call TeXInsertBibliography()<CR>
map <Leader>cr	:call TeXScanBibliography()<CR>
" }}}
" Running commands {{{
map <C-T>V		:call TeXCompilePS()<CR>
map <C-T>v		:call TeXViewPS()<CR>
map! <C-T>v		<Esc>:call TeXViewPS()<CR>a
map <C-T>M		:call TeXCreateMakefile()<CR>
map <C-T>D		:call TeXCompileDVI()<CR>
map <C-T>d		:call TeXViewDVI()<CR>
map! <C-T>d		<Esc>:call TeXViewDVI()<CR>a
map <C-T>P		:call TeXCompilePDF()<CR>
map <C-T>p		:call TeXViewPDF()<CR>
map! <C-T>p		<Esc>:call TeXViewPDF()<CR>a
" }}}
" }}}
