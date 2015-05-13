" Maintainer:	Henrique C. Alves (hcarvalhoalves@gmail.com)
" Version:      1.0
" Last Change:	September 25 2008

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "mustang_ro"

hi CursorLine   ctermbg=236             cterm=NONE
hi CursorColumn ctermbg=236
hi MatchParen   ctermfg=157 ctermbg=237 cterm=bold
hi Pmenu 		ctermfg=255 ctermbg=238
hi PmenuSel 	ctermfg=0   ctermbg=148

" General colors
hi Cursor 		ctermbg=241
hi Normal 		ctermfg=253 ctermbg=234
hi NonText 		ctermfg=244 ctermbg=234
hi LineNr 		ctermfg=244 ctermbg=232
hi StatusLine 	ctermfg=253 ctermbg=238 cterm=italic
hi StatusLineNC ctermfg=246 ctermbg=238
hi VertSplit 	ctermfg=235 ctermbg=234
hi Folded 		ctermbg=236 ctermfg=248
hi Title		ctermfg=254             cterm=bold
hi Visual		ctermfg=234 ctermbg=253
hi SpecialKey	ctermfg=244 ctermbg=236
hi ColorColumn  ctermbg=236

" Syntax highlighting
hi Comment 		ctermfg=244
hi Todo 		ctermfg=245
hi Boolean      ctermfg=148
hi String 		ctermfg=148
hi Identifier 	ctermfg=148
hi Function 	ctermfg=255
hi Type 		ctermfg=103
hi Statement 	ctermfg=103
hi Keyword		ctermfg=208
hi Constant 	ctermfg=208
hi Number		ctermfg=208
hi Special		ctermfg=208
hi PreProc 		ctermfg=230

" git gutter
hi SignColumn ctermbg=234
"hi GitGutterAdd
"hi GitGutterChange
"hi GitGutterDelete
"hi GitGutterChangeDelete
