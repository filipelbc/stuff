" Vim plugin file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2016 Abr 11 17:26:55
"
" About:         Function for highlighting the colors in a color file

fun SynColors()

    syntax match synNormal "^hi Normal .*"
    hi link synNormal Normal

    syntax match synBoolean "^hi Boolean .*"
    hi link synBoolean Boolean
    syntax match synCharacter "^hi Character .*"
    hi link synCharacter Character
    syntax match synColorColumn "^hi ColorColumn .*"
    hi link synColorColumn ColorColumn
    syntax match synComment "^hi Comment .*"
    hi link synComment Comment
    syntax match synConceal "^hi Conceal .*"
    hi link synConceal Conceal
    syntax match synConditional "^hi Conditional .*"
    hi link synConditional Conditional
    syntax match synConstant "^hi Constant .*"
    hi link synConstant Constant
    syntax match synCursor "^hi Cursor .*"
    hi link synCursor Cursor
    syntax match synCursorColumn "^hi CursorColumn .*"
    hi link synCursorColumn CursorColumn
    syntax match synCursorIm "^hi CursorIm .*"
    hi link synCursorIm CursorIm
    syntax match synCursorLine "^hi CursorLine .*"
    hi link synCursorLine CursorLine
    syntax match synCursorLineNr "^hi CursorLineNr .*"
    hi link synCursorLineNr CursorLineNr
    syntax match synDebug "^hi Debug .*"
    hi link synDebug Debug
    syntax match synDefine "^hi Define .*"
    hi link synDefine Define
    syntax match synDelimiter "^hi Delimiter .*"
    hi link synDelimiter Delimiter
    syntax match synDiffAdd "^hi DiffAdd .*"
    hi link synDiffAdd DiffAdd
    syntax match synDiffChange "^hi DiffChange .*"
    hi link synDiffChange DiffChange
    syntax match synDiffDelete "^hi DiffDelete .*"
    hi link synDiffDelete DiffDelete
    syntax match synDiffText "^hi DiffText .*"
    hi link synDiffText DiffText
    syntax match synDirectory "^hi Directory .*"
    hi link synDirectory Directory
    syntax match synError "^hi Error .*"
    hi link synError Error
    syntax match synErrorMsg "^hi ErrorMsg .*"
    hi link synErrorMsg ErrorMsg
    syntax match synException "^hi Exception .*"
    hi link synException Exception
    syntax match synFloat "^hi Float .*"
    hi link synFloat Float
    syntax match synFoldColumn "^hi FoldColumn .*"
    hi link synFoldColumn FoldColumn
    syntax match synFolded "^hi Folded .*"
    hi link synFolded Folded
    syntax match synFunction "^hi Function .*"
    hi link synFunction Function
    syntax match synIdentifier "^hi Identifier .*"
    hi link synIdentifier Identifier
    syntax match synIgnore "^hi Ignore .*"
    hi link synIgnore Ignore
    syntax match synIncSearch "^hi IncSearch .*"
    hi link synIncSearch IncSearch
    syntax match synInclude "^hi Include .*"
    hi link synInclude Include
    syntax match synKeyword "^hi Keyword .*"
    hi link synKeyword Keyword
    syntax match synLabel "^hi Label .*"
    hi link synLabel Label
    syntax match synLineNr "^hi LineNr .*"
    hi link synLineNr LineNr
    syntax match synMacro "^hi Macro .*"
    hi link synMacro Macro
    syntax match synMatchParen "^hi MatchParen .*"
    hi link synMatchParen MatchParen
    syntax match synMenu "^hi Menu .*"
    hi link synMenu Menu
    syntax match synModeMsg "^hi ModeMsg .*"
    hi link synModeMsg ModeMsg
    syntax match synMoreMsg "^hi MoreMsg .*"
    hi link synMoreMsg MoreMsg
    syntax match synNonText "^hi NonText .*"
    hi link synNonText NonText
    syntax match synNumber "^hi Number .*"
    hi link synNumber Number
    syntax match synOperator "^hi Operator .*"
    hi link synOperator Operator
    syntax match synPmenu "^hi Pmenu .*"
    hi link synPmenu Pmenu
    syntax match synPmenuSbar "^hi PmenuSbar .*"
    hi link synPmenuSbar PmenuSbar
    syntax match synPmenuSel "^hi PmenuSel .*"
    hi link synPmenuSel PmenuSel
    syntax match synPmenuThumb "^hi PmenuThumb .*"
    hi link synPmenuThumb PmenuThumb
    syntax match synPreCondit "^hi PreCondit .*"
    hi link synPreCondit PreCondit
    syntax match synPreProc "^hi PreProc .*"
    hi link synPreProc PreProc
    syntax match synQuestion "^hi Question .*"
    hi link synQuestion Question
    syntax match synRepeat "^hi Repeat .*"
    hi link synRepeat Repeat
    syntax match synScrollbar "^hi Scrollbar .*"
    hi link synScrollbar Scrollbar
    syntax match synSearch "^hi Search .*"
    hi link synSearch Search
    syntax match synSignColumn "^hi SignColumn .*"
    hi link synSignColumn SignColumn
    syntax match synSpecial "^hi Special .*"
    hi link synSpecial Special
    syntax match synSpecialChar "^hi SpecialChar .*"
    hi link synSpecialChar SpecialChar
    syntax match synSpecialComment "^hi SpecialComment .*"
    hi link synSpecialComment SpecialComment
    syntax match synSpecialKey "^hi SpecialKey .*"
    hi link synSpecialKey SpecialKey
    syntax match synSpellBad "^hi SpellBad .*"
    hi link synSpellBad SpellBad
    syntax match synSpellCap "^hi SpellCap .*"
    hi link synSpellCap SpellCap
    syntax match synSpellLocal "^hi SpellLocal .*"
    hi link synSpellLocal SpellLocal
    syntax match synSpellRare "^hi SpellRare .*"
    hi link synSpellRare SpellRare
    syntax match synStatement "^hi Statement .*"
    hi link synStatement Statement
    syntax match synStatusLine "^hi StatusLine .*"
    hi link synStatusLine StatusLine
    syntax match synStatusLineNC "^hi StatusLineNC .*"
    hi link synStatusLineNC StatusLineNC
    syntax match synStorageClass "^hi StorageClass .*"
    hi link synStorageClass StorageClass
    syntax match synString "^hi String .*"
    hi link synString String
    syntax match synStructure "^hi Structure .*"
    hi link synStructure Structure
    syntax match synTabLine "^hi TabLine .*"
    hi link synTabLine TabLine
    syntax match synTabLineFill "^hi TabLineFill .*"
    hi link synTabLineFill TabLineFill
    syntax match synTabLineSel "^hi TabLineSel .*"
    hi link synTabLineSel TabLineSel
    syntax match synTag "^hi Tag .*"
    hi link synTag Tag
    syntax match synTitle "^hi Title .*"
    hi link synTitle Title
    syntax match synTodo "^hi Todo .*"
    hi link synTodo Todo
    syntax match synType "^hi Type .*"
    hi link synType Type
    syntax match synTypeDef "^hi TypeDef .*"
    hi link synTypeDef TypeDef
    syntax match synUnderlined "^hi Underlined .*"
    hi link synUnderlined Underlined
    syntax match synVertSplit "^hi VertSplit .*"
    hi link synVertSplit VertSplit
    syntax match synVisual "^hi Visual .*"
    hi link synVisual Visual
    syntax match synVisualNOS "^hi VisualNOS .*"
    hi link synVisualNOS VisualNOS
    syntax match synWarningMsg "^hi WarningMsg .*"
    hi link synWarningMsg WarningMsg
    syntax match synWildMenu "^hi WildMenu .*"
    hi link synWildMenu WildMenu

    syntax match synSyntasticErrorLine "^hi SyntasticErrorLine .*"
    hi link synSyntasticErrorLine SyntasticErrorLine
    syntax match synSyntasticErrorSign "^hi SyntasticErrorSign .*"
    hi link synSyntasticErrorSign SyntasticErrorSign
    syntax match synSyntasticWarningLine "^hi SyntasticWarningLine .*"
    hi link synSyntasticWarningLine SyntasticWarningLine
    syntax match synSyntasticWarningSign "^hi SyntasticWarningSign .*"
    hi link synSyntasticWarningSign SyntasticWarningSign

    syntax match synEmphasis "^hi Emphasis .*"
    hi link synEmphasis Emphasis
    syntax match synCommentTitle "^hi CommentTitle .*"
    hi link synCommentTitle CommentTitle
    syntax match synCustomType "^hi CustomType .*"
    hi link synCustomType CustomType

endfun

