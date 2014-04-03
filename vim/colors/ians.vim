" Ian's Vim color scheme
" only intended to be used with a 16-color terminal
" I use the solarized palette

set background=dark
hi! clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="ians"

" Basic ui stuff
hi Cursor              ctermfg=7     ctermbg=1
hi CursorLine          ctermbg=0     cterm=NONE
hi MatchParen          ctermfg=0     ctermbg=3
hi ColorColumn         ctermbg=0
hi LineNr              ctermfg=0     ctermbg=NONE
hi Visual              ctermfg=7     ctermbg=0
hi IncSearch           ctermfg=0     ctermbg=3    cterm=NONE
hi Search              ctermfg=0     ctermbg=3
hi StatusLine          ctermfg=7     ctermbg=2     cterm=NONE
hi StatusLineNC        ctermfg=7     ctermbg=0     cterm=NONE
hi VertSplit           ctermfg=0     ctermbg=0
hi TabLine             ctermfg=7     ctermbg=0     cterm=NONE
hi TabLineSel          ctermfg=2     ctermbg=0
hi Folded              ctermfg=3     ctermbg=0
hi Directory           ctermfg=3
hi Title               ctermfg=3     cterm=NONE
hi ErrorMsg            ctermfg=7     ctermbg=1
hi DiffAdd             ctermfg=0     ctermbg=2
hi DiffChange          ctermfg=0     ctermbg=3
hi DiffDelete          ctermfg=0     ctermbg=1
hi DiffText            ctermfg=0     ctermbg=11    cterm=NONE
hi User1               ctermfg=7     ctermbg=6
hi User2               ctermfg=7     ctermbg=4
hi User3               ctermfg=7     ctermbg=3
hi User4               ctermfg=7     ctermbg=0
hi User5               ctermfg=7     ctermbg=13
hi User6               ctermfg=7     ctermbg=14
hi User7               ctermfg=7     ctermbg=12
hi User8               ctermfg=7     ctermbg=11
hi User9               ctermfg=7     ctermbg=8
hi! link CursorColumn  CursorLine
hi! link SignColumn    Normal
hi! link WildMenu      Visual
hi! link FoldColumn    SignColumn
hi! link WarningMsg    ErrorMsg
hi! link MoreMsg       Title
hi! link Question      MoreMsg
hi! link ModeMsg       MoreMsg
hi! link TabLineFill   StatusLineNC
hi! link SpecialKey    NonText

" The popup-menu (eg on Ctrl-N)
hi Pmenu               ctermfg=15    ctermbg=0
hi PmenuThumb          ctermbg=7
hi PmenuSBar           ctermbg=8
hi PmenuSel            ctermfg=0     ctermbg=4

" Spelling stuff
hi SpellBad            ctermfg=1   cterm=underline  ctermbg=NONE
hi SpellCap            ctermfg=7   ctermbg=NONE
hi SpellRare           ctermfg=7   ctermbg=NONE
hi SpellLocal          ctermfg=1   cterm=underline  ctermbg=NONE
hi NonText             ctermfg=7


" main programming like stuff here
hi Delimiter       ctermfg=7
hi Comment         ctermfg=2
hi Underlined      ctermfg=4   cterm=underline
hi Type            ctermfg=3
hi String          ctermfg=6
hi Keyword         ctermfg=4
hi Todo            ctermfg=1
hi Function        ctermfg=4
hi Identifier      ctermfg=7
hi Statement       ctermfg=4
hi Constant        ctermfg=6
hi Number          ctermfg=6
hi Boolean         ctermfg=6
hi Special         ctermfg=6
hi Ignore          ctermfg=0
hi! link Operator  Delimiter
hi! link PreProc   Keyword
hi! link Error     ErrorMsg

