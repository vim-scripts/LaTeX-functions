" Menu Creation {{{
" Insert Enviroment Menu {{{
amenu 100.100 &TeX.&Enviroment.&Document 	:call TeXInsertEnviroment("document")<CR>
amenu 100.102 &TeX.&Enviroment.&Equation		:call TeXInsertEnviroment("equation")<CR>
amenu 100.104 &TeX.&Enviroment.&Eqnarray		:call TeXInsertEnviroment("eqnarray")<CR>
amenu 100.106 &TeX.&Enviroment.&Eqnarray*	:call TeXInsertEnviroment("eqnarray*")<CR>
amenu 100.108 &TeX.&Enviroment.&DisplayMath	:call TeXInsertEnviroment("displaymath")<CR>
amenu 100.112 &TeX.&Enviroment.&Table		:call TeXInsertEnviroment("table")<CR>
amenu 100.114 &TeX.&Enviroment.&Table*		:call TeXInsertEnviroment("table*")<CR>
amenu 100.116 &TeX.&Enviroment.&Figure		:call TeXInsertEnviroment("figure")<CR>
amenu 100.118 &TeX.&Enviroment.&Figure*		:call TeXInsertEnviroment("figure*")<CR>
amenu 100.120 &TeX.&Enviroment.&Array		:call TeXInsertEnviroment("array")<CR>
amenu 100.122 &TeX.&Enviroment.&Center		:call TeXInsertEnviroment("center")<CR>
amenu 100.124 &TeX.&Enviroment.&Flushleft	:call TeXInsertEnviroment("flushleft")<CR>
amenu 100.126 &TeX.&Enviroment.&Flushright	:call TeXInsertEnviroment("flushright")<CR>
amenu 100.128 &TeX.&Enviroment.&Verbatim		:call TeXInsertEnviroment("verbatim")<CR>
amenu 100.130 &TeX.&Enviroment.&Quotation	:call TeXInsertEnviroment("quotation")<CR>
amenu 100.132 &TeX.&Enviroment.&Quote		:call TeXInsertEnviroment("quote")<CR>
amenu 100.134 &TeX.&Enviroment.&Itemize		:call TeXInsertEnviroment("itemize")<CR>
amenu 100.136 &TeX.&Enviroment.&Enumerate	:call TeXInsertEnviroment("enumerate")<CR>
amenu 100.138 &TeX.&Enviroment.&Description	:call TeXInsertEnviroment("descripttion")<CR>
amenu 100.140 &TeX.&Enviroment.&Tabular		:call TeXInsertEnviroment("tabular")<CR>
amenu 100.142 &TeX.&Enviroment.&Tabbing		:call TeXInsertEnviroment("tabbing")<CR>
amenu 100.144 &TeX.&Enviroment.&Minipage		:call TeXInsertEnviroment("minipage")<CR>
" }}}
" Change Enviroment Menu {{{
amenu 100.200 &TeX.&Change\ Enviroment.&Document 	:call TeXRenameEnviroment("document")<CR>
amenu 100.202 &TeX.&Change\ Enviroment.&Equation		:call TeXRenameEnviroment("equation")<CR>
amenu 100.204 &TeX.&Change\ Enviroment.&Eqnarray		:call TeXRenameEnviroment("eqnarray")<CR>
amenu 100.206 &TeX.&Change\ Enviroment.&Eqnarray*	:call TeXRenameEnviroment("eqnarray*")<CR>
amenu 100.208 &TeX.&Change\ Enviroment.&DisplayMath	:call TeXRenameEnviroment("displaymath")<CR>
amenu 100.212 &TeX.&Change\ Enviroment.&Table		:call TeXRenameEnviroment("table")<CR>
amenu 100.214 &TeX.&Change\ Enviroment.&Table*		:call TeXRenameEnviroment("table*")<CR>
amenu 100.216 &TeX.&Change\ Enviroment.&Figure		:call TeXRenameEnviroment("figure")<CR>
amenu 100.218 &TeX.&Change\ Enviroment.&Figure*		:call TeXRenameEnviroment("figure*")<CR>
amenu 100.220 &TeX.&Change\ Enviroment.&Array		:call TeXRenameEnviroment("array")<CR>
amenu 100.222 &TeX.&Change\ Enviroment.&Center		:call TeXRenameEnviroment("center")<CR>
amenu 100.224 &TeX.&Change\ Enviroment.&Flushleft	:call TeXRenameEnviroment("flushleft")<CR>
amenu 100.226 &TeX.&Change\ Enviroment.&Flushright	:call TeXRenameEnviroment("flushright")<CR>
amenu 100.228 &TeX.&Change\ Enviroment.&Verbatim		:call TeXRenameEnviroment("verbatim")<CR>
amenu 100.230 &TeX.&Change\ Enviroment.&Quotation	:call TeXRenameEnviroment("quotation")<CR>
amenu 100.232 &TeX.&Change\ Enviroment.&Quote		:call TeXRenameEnviroment("quote")<CR>
amenu 100.234 &TeX.&Change\ Enviroment.&Itemize		:call TeXRenameEnviroment("itemize")<CR>
amenu 100.236 &TeX.&Change\ Enviroment.&Enumerate	:call TeXRenameEnviroment("enumerate")<CR>
amenu 100.238 &TeX.&Change\ Enviroment.&Description	:call TeXRenameEnviroment("descripttion")<CR>
amenu 100.240 &TeX.&Change\ Enviroment.&Tabular		:call TeXRenameEnviroment("tabular")<CR>
amenu 100.242 &TeX.&Change\ Enviroment.&Tabbing		:call TeXRenameEnviroment("tabbing")<CR>
amenu 100.244 &TeX.&Change\ Enviroment.&Minipage		:call TeXRenameEnviroment("minipage")<CR>
" }}}
amenu 100.300 &TeX.&Delete\ Enviroment		:call TeXDeleteEnviroment()<CR>
amenu 100.302 &TeX.&Fold\ Enviromemt			:call TeXFoldEnviroment()<CR>
amenu 100.310 &TeX.-SEP1-					<Nop>
" Font Menu {{{
amenu 100.350 &TeX.&Font.&Bold				:call TeXInsertFont("bf")<CR>
amenu 100.352 &TeX.&Font.&Italic				:call TeXInsertFont("it")<CR>
amenu 100.354 &TeX.&Font.&Type\ writer		:call TeXInsertFont("tt")<CR>
amenu 100.356 &TeX.&Font.&Emphasized			:call TeXInsertFont("em")<CR>
amenu 100.358 &TeX.&Font.&large				:call TeXInsertFont("large")<CR>
amenu 100.360 &TeX.&Font.&Large				:call TeXInsertFont("Large")<CR>
amenu 100.362 &TeX.&Font.&small				:call TeXInsertFont("small")<CR>
amenu 100.364 &TeX.&Font.&Small				:call TeXInsertFont("Small")<CR>
amenu 100.366 &TeX.&Font.&huge				:call TeXInsertFont("huge")<CR>
amenu 100.368 &TeX.&Font.&Huge				:call TeXInsertFont("Huge")<CR>
" }}}
" Font Change Menu {{{
amenu 100.400 &TeX.&Font\ Change.&Bold				:call TeXChangeFont("bf")<CR>
amenu 100.402 &TeX.&Font\ Change.&Italic				:call TeXChangeFont("it")<CR>
amenu 100.404 &TeX.&Font\ Change.&Type\ writer		:call TeXChangeFont("tt")<CR>
amenu 100.406 &TeX.&Font\ Change.&Emphasized			:call TeXChangeFont("em")<CR>
amenu 100.408 &TeX.&Font\ Change.&large				:call TeXChangeFont("large")<CR>
amenu 100.410 &TeX.&Font\ Change.&Large				:call TeXChangeFont("Large")<CR>
amenu 100.412 &TeX.&Font\ Change.&small				:call TeXChangeFont("small")<CR>
amenu 100.414 &TeX.&Font\ Change.&Small				:call TeXChangeFont("Small")<CR>
amenu 100.416 &TeX.&Font\ Change.&huge				:call TeXChangeFont("huge")<CR>
amenu 100.418 &TeX.&Font\ Change.&Huge				:call TeXChangeFont("Huge")<CR>
" }}}
amenu 100.490 &TeX.&Font\ Delete				:call TeXDeleteFont()<CR>
amenu 100.495 &TeX.-SEP2-					<Nop>
amenu 100.500 &TeX.&Cite.&Rescan				:call TeXScanBibliography()<CR>
amenu 100.502 &TeX.&Cite.&Insert\ Cite		:call TeXInsertBibliography()<CR>
amenu 100.504 &TeX.&Cite.&Bibliography		:call TeXInsertCommand("bibliography", 1)<CR>
amenu 100.520 &TeX.-SEP3-					<Nop>
amenu 100.540 &TeX.&Reference.&Rescan		:call TeXRefScan()<CR>
amenu 100.542 &TeX.&Reference.&Insert\ Reference	:call TeXInsertRef()<CR>
amenu 100.544 &TeX.&Reference.&Label			:call TeXInsertCommand("label", 1)<CR>
amenu 100.560 &TeX.-SEP4-					<Nop>
amenu 100.562 &TeX.&Sections.&Chapter		:call TeXInsertCommand("chapter", 1)<CR>
amenu 100.564 &TeX.&Sections.&Section		:call TeXInsertCommand("section", 1)<CR>
amenu 100.566 &TeX.&Sections.S&ubSection		:call TeXInsertCommand("subsection", 1)<CR>
amenu 100.568 &TeX.&Sections.Su&bSubSection	:call TeXInsertCommand("subsubsection", 1)<CR>
amenu 100.570 &TeX.&Sections.&Paragraph		:call TeXInsertCommand("paragraph", 1)<CR>
amenu 100.572 &TeX.&Sections.SubPa&ragraph	:call TeXInsertCommand("subparagraph", 1)<CR>
amenu 100.574 &TeX.&Sections.-SEP7-			<Nop>
amenu 100.576 &TeX.&Sections.&Appendix		:call TeXInsertCommand("appendix", 1)<CR>
amenu 100.595 &TeX.-SEP5-					<Nop>
amenu 100.600 &TeX.&Insert\ Item				:call TeXInsertItem()<CR>
amenu 100.602 &TeX.&Comment\ Region			:call TeXComment()<CR>
amenu 100.604 &TeX.&Uncomment\ Region		:call TeXUncomment()<CR>
amenu 100.900 &TeX.-SEP10-					<Nop>
amenu 100.902 &TeX.&Compile					:call TeXCompile()<CR>
amenu 100.904 &TeX.View\ &DVI				:call TeXViewDVI()<CR>
amenu 100.906 &TeX.&Make\ PS					:call TeXCompilePS()<CR>
amenu 100.908 &TeX.View\ &PS					:call TeXViewPS()<CR>
" }}}
