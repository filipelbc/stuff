" Vim color file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2016 Jul 05 09:53:51

hi clear

if exists("syntax_on")
    syntax reset
endif

set background=dark

let g:colors_name = "lolpes"

" Standard Groups:

hi Normal                cterm=NONE        ctermfg=NONE        ctermbg=NONE

hi Boolean               cterm=NONE        ctermfg=207         ctermbg=NONE
hi Character             cterm=NONE        ctermfg=207         ctermbg=NONE
hi ColorColumn           cterm=NONE        ctermfg=NONE        ctermbg=233
hi Comment               cterm=NONE        ctermfg=028         ctermbg=NONE
hi Conceal               cterm=NONE        ctermfg=000         ctermbg=NONE
hi Conditional           cterm=NONE        ctermfg=135         ctermbg=NONE
hi Constant              cterm=NONE        ctermfg=207         ctermbg=NONE
hi Cursor                cterm=NONE        ctermfg=NONE        ctermbg=088
hi CursorColumn          cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi CursorIm              cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi CursorLine            cterm=NONE        ctermfg=NONE        ctermbg=235
hi CursorLineNr          cterm=NONE        ctermfg=000         ctermbg=235
hi Debug                 cterm=NONE        ctermfg=202         ctermbg=NONE
hi Define                cterm=NONE        ctermfg=063         ctermbg=NONE
hi Delimiter             cterm=NONE        ctermfg=203         ctermbg=NONE
hi DiffAdd               cterm=NONE        ctermfg=040         ctermbg=NONE
hi DiffChange            cterm=NONE        ctermfg=208         ctermbg=NONE
hi DiffDelete            cterm=NONE        ctermfg=196         ctermbg=NONE
hi DiffText              cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi Directory             cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi Error                 cterm=NONE        ctermfg=000         ctermbg=160
hi ErrorMsg              cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi Exception             cterm=NONE        ctermfg=135         ctermbg=NONE
hi Float                 cterm=NONE        ctermfg=207         ctermbg=NONE
hi FoldColumn            cterm=NONE        ctermfg=000         ctermbg=NONE
hi Folded                cterm=NONE        ctermfg=243         ctermbg=NONE
hi Function              cterm=NONE        ctermfg=255         ctermbg=NONE
hi Identifier            cterm=NONE        ctermfg=255         ctermbg=NONE
hi Ignore                cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi IncSearch             cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi Include               cterm=NONE        ctermfg=063         ctermbg=NONE
hi Keyword               cterm=NONE        ctermfg=135         ctermbg=NONE
hi Label                 cterm=NONE        ctermfg=135         ctermbg=NONE
hi LineNr                cterm=NONE        ctermfg=000         ctermbg=NONE
hi Macro                 cterm=NONE        ctermfg=255         ctermbg=NONE
hi MatchParen            cterm=reverse     ctermfg=NONE        ctermbg=NONE
hi Menu                  cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi ModeMsg               cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi MoreMsg               cterm=NONE        ctermfg=NONE        ctermbg=000
hi NonText               cterm=NONE        ctermfg=000         ctermbg=NONE
hi Number                cterm=NONE        ctermfg=207         ctermbg=NONE
hi Operator              cterm=NONE        ctermfg=045         ctermbg=NONE
hi Pmenu                 cterm=NONE        ctermfg=NONE        ctermbg=000
hi PmenuSbar             cterm=NONE        ctermfg=234         ctermbg=000
hi PmenuSel              cterm=bold        ctermfg=NONE        ctermbg=000
hi PmenuThumb            cterm=NONE        ctermfg=234         ctermbg=000
hi PreCondit             cterm=NONE        ctermfg=063         ctermbg=NONE
hi PreProc               cterm=NONE        ctermfg=063         ctermbg=NONE
hi Question              cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi Repeat                cterm=NONE        ctermfg=135         ctermbg=NONE
hi Scrollbar             cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi Search                cterm=NONE        ctermfg=000         ctermbg=209
hi SignColumn            cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi Special               cterm=NONE        ctermfg=202         ctermbg=NONE
hi SpecialChar           cterm=NONE        ctermfg=202         ctermbg=NONE
hi SpecialComment        cterm=NONE        ctermfg=202         ctermbg=NONE
hi SpecialKey            cterm=NONE        ctermfg=202         ctermbg=NONE
hi SpellBad              cterm=NONE        ctermfg=207         ctermbg=237
hi SpellCap              cterm=NONE        ctermfg=207         ctermbg=237
hi SpellLocal            cterm=NONE        ctermfg=207         ctermbg=237
hi SpellRare             cterm=NONE        ctermfg=207         ctermbg=237
hi Statement             cterm=NONE        ctermfg=135         ctermbg=NONE
hi StatusLine            cterm=bold        ctermfg=NONE        ctermbg=000
hi StatusLineNC          cterm=NONE        ctermfg=236         ctermbg=000
hi StorageClass          cterm=NONE        ctermfg=135         ctermbg=NONE
hi String                cterm=NONE        ctermfg=228         ctermbg=NONE
hi Structure             cterm=NONE        ctermfg=135         ctermbg=NONE
hi TabLine               cterm=NONE        ctermfg=236         ctermbg=000
hi TabLineFill           cterm=NONE        ctermfg=NONE        ctermbg=000
hi TabLineSel            cterm=bold        ctermfg=NONE        ctermbg=000
hi Tag                   cterm=NONE        ctermfg=211         ctermbg=NONE
hi Title                 cterm=NONE        ctermfg=255         ctermbg=NONE
hi Todo                  cterm=NONE        ctermfg=000         ctermbg=202
hi Type                  cterm=NONE        ctermfg=036         ctermbg=NONE
hi TypeDef               cterm=NONE        ctermfg=036         ctermbg=NONE
hi Underlined            cterm=underline   ctermfg=255         ctermbg=NONE
hi VertSplit             cterm=NONE        ctermfg=NONE        ctermbg=000
hi Visual                cterm=reverse     ctermfg=NONE        ctermbg=NONE
hi VisualNOS             cterm=underline   ctermfg=NONE        ctermbg=NONE
hi WarningMsg            cterm=NONE        ctermfg=202         ctermbg=000
hi WildMenu              cterm=NONE        ctermfg=NONE        ctermbg=NONE

" Syntastic Plugin:

hi SyntasticErrorLine    cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi SyntasticErrorSign    cterm=NONE        ctermfg=NONE        ctermbg=088
hi SyntasticWarningLine  cterm=NONE        ctermfg=NONE        ctermbg=NONE
hi SyntasticWarningSign  cterm=NONE        ctermfg=NONE        ctermbg=088

" Custom Groups:

hi Emphasis              cterm=bold        ctermfg=NONE        ctermbg=NONE
hi CommentTitle          cterm=underline   ctermfg=034         ctermbg=NONE
hi CustomType            cterm=NONE        ctermfg=077         ctermbg=NONE

