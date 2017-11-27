" Vim syntax file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2016 Abr 15 19:36:56
"
" Language:      LaTeX

if exists("b:current_syntax")
    finish
endif

syntax clear

" File Extension:
let s:extfname=expand("%:e")
if s:extfname == "sty" || s:extfname == "cls" || s:extfname == "clo" || s:extfname == "dtx" || s:extfname == "ltx"
    let b:tex_sty= 1
else
    let b:tex_sty= 0
endif

" Clusters:
syntax cluster texScopeContains contains=texScope,texStatement,texTypeStyle,texEmphasis,texHighlight,texTypeSize,texLength,texPunctuation,texVerbatim,texSpecialChar,texLineBreak,texBadAlignment,texBadScript,texBadArg,texEnv,texEnvVerb,texEnvTab,texMathEnv,texMathEnvInline,texCite,texReference,texTagLabel,texTagRef,texInclude,texInput,texNewCmd,texUrl,texComment,@Spell

syntax cluster texEnvContains contains=texBadScope,@texScopeContains,@Spell

syntax cluster texMathContains contains=texStatement,texTypeStyle,texTypeSize,texSpecialChar,texLineBreak,texMathSpacing,texMathPunctuation,texMathOperator,texMathBadSubEnv,texMathBadScope,texMathSubEnv,texMathScope,texMathBadEnv,texInput,texBadAlignment,texComment,@NoSpell

syntax cluster texOptScopeContains contains=texOptScope,texStatement,texLength,texSpecialChar,texPunctuation,texBadAlignment,texBadScript,texBadArg,texComment,@NoSpell

syntax cluster texNewCmdScopeContains contains=texNewCmdScope,texStatement,texTypeStyle,texTypeSize,texLength,texPunctuation,texSpecialChar,texLineBreak,texVerbatim,texNewCmdEnv,texNewCmdArgRef,texNewCmdMathDel,texReference,texTagLabel,texTagRef,texInclude,texInput,texComment,@Spell

" Basic Command:
if b:tex_sty
    syntax match texStatement "\\[a-zA-Z@]\+" contains=@NoSpell
else
    syntax match texStatement "\\[a-zA-Z]\+" contains=@NoSpell
endif

" Type Style:
syntax match texTypeStyle "\\\(rm\|em\|bf\|it\|sl\|sf\|sc\|tt\)\>" contains=@NoSpell

syntax match texTypeStyle "\\text\(bf\|it\|md\|rm\|sc\|sf\|sl\|tt\|up\)\>" contains=@NoSpell

syntax match texTypeStyle "\\math\(bb\|bf\|cal\|frak\|it\|normal\|rm\|sf\|tt\)\>" contains=@NoSpell

syntax match texTypeStyle "\\\(rm\|sf\|tt\)family\>" contains=@NoSpell

syntax match texTypeStyle "\\\(it\|sc\|sl\|up\)shape\>" contains=@NoSpell

syntax match texTypeStyle "\\\(bf\|md\)series\>" contains=@NoSpell

syntax match texTypeStyle "\\emph\>" contains=@NoSpell

syntax match texTypeStyle "\\text\(super\|sub\)script\>" contains=@NoSpell

syntax match texEmphasis "\\emph\>" contains=@NoSpell nextgroup=texEmphasisScope
syntax region texEmphasisScope matchgroup=texScopeDel start="{" end="}" contained contains=@texScopeContains

syntax match texHighlight "\\hl\>" contains=@NoSpell nextgroup=texHighlightScope
syntax region texHighlightScope matchgroup=texScopeDel start="{" end="}" contained contains=@texScopeContains

" Type Size:
syntax match texTypeSize "\\\(tiny\|scriptsize\|footnotesize\|small\|normalsize\|large\|Large\|LARGE\|huge\|Huge\)\>" contains=@NoSpell

" Lengths:
syntax match texLength "\<\d\+\([.,]\d\+\)\=\s*\(true\)\=\s*\(bp\|cc\|cm\|dd\|em\|ex\|in\|mm\|pc\|pt\|sp\)\>" contains=@NoSpell

syntax match texLength "\<\d\+\([.,]\d\+\)\=\s*\ze\\\w" contains=@NoSpell

" Punctuation:
syntax match texPunctuation "=\|+\|:\|,\|\.\|;\|!\|?\|---\=\|`\|'\|,\|>>\|<<\|\[\|]\|(\|)\|\~"

" Verb:
syntax region texVerbatim matchgroup=texVerbDel start="\\verb\z(.\)" end="\z1" contains=@NoSpell

" Special:
syntax match texSpecialChar "\\[$&%#{}_-]"

" Line Break:
syntax match texLineBreak "\\\\" nextgroup=texLineBreakLen
syntax region texLineBreakLen matchgroup=texLineBreak start="\[" end="]" contained contains=@texOptScopeContains transparent

" Bad Char:
syntax match texBadAlignment "&"
syntax match texBadScript "_\|\^"
syntax match texBadArg "#"

" Alignment Char:
syntax match texAlignment "&" contained

" Scope:
syntax match texBadScope "}"

syntax region texScope matchgroup=texScopeDel start="{" end="}" contains=@texScopeContains transparent

" Environments:
syntax match texBadEnv "\\end{[a-zA-Z]\+}" contains=@NoSpell

syntax region texEnv matchgroup=texEnvDel start="\\begin{\z([a-zA-Z]\+\)}" end="\\end{\z1}" contains=@texEnvContains transparent

syntax region texEnvBeamerFrame matchgroup=texEnvDel start="\\begin{frame}" end="\\end{frame}" contains=@texEnvContains,texTitleBeamerFrame transparent

syntax region texEnvVerb matchgroup=texEnvDel start="\\begin{verbatim}" end="\\end{verbatim}" contains=@NoSpell transparent
syntax region texEnvVerb matchgroup=texEnvDel start="\\begin{lstlisting}" end="\\end{lstlisting}" contains=@NoSpell transparent

syntax region texEnvTab matchgroup=texEnvTabDel start="\\begin{tabula\z(r[\*xy]\=\)}" end="\\end{tabula\z1}" contained contains=@texEnvContains,texAlignment transparent

syntax region texEnvTab matchgroup=texEnvTabDel start="\\begin{tabu}" end="\\end{tabu}" contained contains=@texEnvContains,texAlignment transparent

syntax region texEnvDoc matchgroup=texEnvDocDel start="\\begin{document}" end="\\end{document}" contains=@texEnvContains,texEnvBeamerFrame,texTitle

" Math:
syntax match texMathPunctuation ":\|,\|\.\|;\|!\|?" contained

syntax match texMathOperator "=\|>\|<\|+\|-\|/\|\^\|_\||" contained

syntax match texMathSpacing "\\\( \|qq\=uad\|,\|:\|;\|!\)" contained

" Math Sub Environments:
syntax match texMathBadSubEnv "\\end{[a-zA-Z]\+}" contained contains=@NoSpell

syntax region texMathSubEnv matchgroup=texMathSubEnvDel start="\\begin{\z([a-zA-Z]\+\)}" end="\\end{\z1}" contained contains=@texMathContains,texAlignment transparent

" Math Scopes:
function! TexNewMathScope(start,end)
    execute 'syntax match texMathBadScope "\('.a:start.'\|'.a:end.'\)" contained contains=@NoSpell'
    execute 'syntax region texMathScope matchgroup=texMathScopeDel start="'.a:start.'" end="'.a:end.'" contained contains=@texMathContains transparent'
endfunction

call TexNewMathScope('\\left(','\\right)')
call TexNewMathScope('\\left\[','\\right]')
call TexNewMathScope('\\left|','\\right|')
call TexNewMathScope('\\left{','\\right}')

call TexNewMathScope('(',')')
call TexNewMathScope('\[',']')
call TexNewMathScope('\\|','\\|')
call TexNewMathScope('{','}')

" Math Environments:
syntax match texMathBadEnv "\$\$\|\$\|\\)\|\\]"

syntax region texMathEnvInline matchgroup=texMathEnvDel start="\$" end="\$" contains=@texMathContains
syntax region texMathEnv matchgroup=texMathEnvDel start="\$\$" end="\$\$" contains=@texMathContains

syntax region texMathEnvInline matchgroup=texMathEnvDel start="\\(" end="\\)" contains=@texMathContains
syntax region texMathEnv matchgroup=texMathEnvDel start="\\\[" end="\\]" contains=@texMathContains

function! TexNewMathEnv(name,star,aligned)
    execute 'syntax match texMathBadEnv "\\end{'.a:name.'}" contains=@NoSpell'
    if a:aligned
        let align=',texAlignment'
    else
        let align=''
    endif
    let env='syntax region texMathEnv matchgroup=texMathEnvDel'
    let cont='@texMathContains,texTagLabel'
    execute env.' start="\\begin{'.a:name.'}" end="\\end{'.a:name.'}" contains='.cont.align.',@NoSpell'
    if a:star
        execute env.' start="\\begin{'.a:name.'\*}" end="\\end{'.a:name.'\*}" contains='.cont.align.',@NoSpell'
    endif
endfunction

call TexNewMathEnv('equation',1,0)
call TexNewMathEnv('multline',1,0)
call TexNewMathEnv('align',1,1)

" Citation:

" TODO biblatex support

syntax match texCite "\\cite\(\(t\|p\|author\)\*\=\|year\(par\)\=\|alt\|alp\|text\)\=\>" contains=@NoSpell nextgroup=texCiteKeys
syntax match texCite "\\nocite\>" contains=@NoSpell nextgroup=texCiteKeys

syntax region texCiteKeys matchgroup=texScopeDel start="{" end="}" contained contains=texCiteDel,@NoSpell

syntax match texCiteDel "," contained

" Tags:
syntax match texTagRef "\\\(eq\)\=ref\>" contains=@NoSpell nextgroup=texTag

syntax match texTagLabel "\\label\>" contains=@NoSpel nextgroup=texTag

syntax region texTag matchgroup=texScopeDel start="{" end="}" contained contains=texTagType,@NoSpell

syntax match texTagType "{\@<=\(ch\|sec\|subsec\|fig\|tab\|eq\|lst\|itm\|alg\|app\|\):" contained

" Titles:
syntax match texTitle "\\\(author\|title\|institute\|date\)\>" contains=@NoSpell nextgroup=texTitleShort,texTitleLong

syntax match texTitle "\\\(part\|chapter\|\(sub\)\{0,2}section\|\(sub\)\=paragraph\)\(\*\|\>\)" contains=@NoSpell nextgroup=texTitleShort,texTitleLong

syntax match texTitleBeamerFrame "\\frame\(sub\)\=title" contains=@NoSpell nextgroup=texTitleLong,texTitleShort

syntax region texTitleShort matchgroup=texScopeDel start="\[" end="]" contained contains=@texScopeContains nextgroup=texTitleLong
syntax region texTitleLong matchgroup=texScopeDel start="{" end="}" contained contains=@texScopeContains

" Option Scope:
syntax region texOptScope matchgroup=texScopeDel start="{" end="}" contained contains=@texOptScopeContains transparent

" Classes:
syntax match texDoc "\\\(documentclass\|LoadClass\)\>" contains=@NoSpell nextgroup=texDocClass,texDocOpt
syntax match texDoc "\\ProvidesClass\>" contains=@NoSpell nextgroup=texDocClass

syntax region texDocOpt matchgroup=texScopeDel start="\[" end="]" contained contains=@texOptScopeContains,@NoSpell nextgroup=texDocClass
syntax region texDocClass matchgroup=texScopeDel start="{" end="}" contained contains=@NoSpell

" Packages:
syntax match texPkg "\\\(usepackage\|RequirePackage\)\>" contains=@NoSpell nextgroup=texPkgSty,texPkgOpt

syntax region texPkgOpt matchgroup=texScopeDel start="\[" end="]" contained contains=@texOptScopeContains,@NoSpell nextgroup=texPkgSty
syntax region texPkgSty matchgroup=texScopeDel start="{" end="}" contained contains=texPkgStyDel,@NoSpell

syntax match texPkgStyDel "," contained

" Includes:
syntax match texInclude "\\\(include\(graphics\)\=\|bibliography\|lstinputlisting\)\>" contains=@NoSpell nextgroup=texIncFile,texIncOpt

syntax match texInput "\\input\>" contains=@NoSpell nextgroup=texIncFile

syntax region texIncScope matchgroup=texScopeDel start="{" end="}" contained transparent contains=texIncFileDel,@NoSpell

syntax region texIncOpt matchgroup=texScopeDel start="\[" end="]" contained contains=@texOptScopeContains,@NoSpell nextgroup=texIncFile
syntax region texIncFile matchgroup=texScopeDel start="{" end="}" contained contains=texIncFileDel,texIncScope,@NoSpell

syntax match texIncFileDel "/" contained

" New Command:
syntax match texNewCmd "\\\(re\)\=newcommand\(\*\|\>\)" nextgroup=texNewCmdName

if b:tex_sty
    syntax match texNewCmdName "{\s*\\[a-zA-Z@]\+\s*}" contains=texStatement,@NoSpell nextgroup=texNewCmdScope,texNewCmdArgNum
else
    syntax match texNewCmdName "{\s*\\[a-zA-Z]\+\s*}" contains=texStatement,@NoSpell nextgroup=texNewCmdScope,texNewCmdArgNum
endif

syntax match texNewCmdArgNum "\[\d]" contained contains=texNewCmdArgNumNum nextgroup=texNewCmdScope,texNewCmdDefault

syntax match texNewCmdArgNumNum "\d" contained

syntax region texNewCmdDefault matchgroup=texScopeDel start="\[" end="]" contained contains=@texOptScopeContains,@NoSpell nextgroup=texNewCmdScope,texNewCmdDefault transparent

syntax region texNewCmdScope matchgroup=texScopeDel start="{" end="}" contained contains=@texNewCmdScopeContains transparent

syntax match texNewCmdEnv "\\\(begin\|end\){[a-zA-Z]\+}" contained contains=@NoSpell

syntax match texNewCmdArgRef "#\d" contained
syntax match texNewCmdMathDel "\$\|\\(\|\\)\|\\\[\|\\]" contained

" TODO newenvironment

" TODO def

" TODO href

syntax match texUrl "\\url\>" contained contains=@NoSpell nextgroup=texUrlScope

syntax region texUrlScope matchgroup=texScopeDel start="{" end="}" contained contains=@NoSpell

" Comments:
syntax region texComment start="%" end="$" keepend contains=texCommentTitle,texCommentSpecial,texCommentTodo,@NoSpell

syntax region texCommentEnd start="\(\\bye\|\\end{document}\)\@<=\_." end="\%$" contains=@NoSpell

syntax keyword texCommentTodo TODO FIXME XXX contained

syntax match texCommentTitle "%\s*\zs\(\(\w\|-\|\.\)\+\s*\)\+:\ze\(\s\|$\)" contained

syntax region texCommentSpecial start="\"" end="\"" contained
syntax region texCommentSpecial start="\'\'" end="\'\'" contained

" Fake Document Environment:
syntax region texEnvDoc matchgroup=texComment start="^%included" end="\%$" contains=@texEnvContains,texEnvBeamerFrame,texTitle

" Highlights:

hi link texAlignment        Delimiter
hi link texBadAlignment     Error
hi link texBadArg           Error
hi link texBadEnv           Error
hi link texBadScope         Error
hi link texBadScript        Error
hi link texCite             Statement
hi link texCiteDel          Statement
hi link texCiteKeys         Tag
hi link texComment          Comment
hi link texCommentEnd       Comment
hi link texCommentSpecial   Special
hi link texCommentTitle     CommentTitle
hi link texCommentTodo      Todo
hi link texDoc              Statement
hi link texDocClass         Function
hi link texDocOpt           Tag
hi link texEmphasis         Type
hi link texEmphasisScope    Emphasis
hi link texHighlight        Type
hi link texHighlightScope   Special
hi link texEnvDel           PreProc
hi link texEnvDocDel        Function
hi link texEnvTabDel        PreProc
hi link texIncFile          Tag
hi link texIncFileDel       Delimiter
hi link texIncOpt           Tag
hi link texInclude          Statement
hi link texInput            Statement
hi link texInputDel         Statement
hi link texLength           Number
hi link texLineBreak        Special
hi link texMathBadEnv       Error
hi link texMathBadSubEnv    Error
hi link texMathBadScope     Error
hi link texMathEnv          String
hi link texMathEnvDel       CustomType
hi link texMathEnvInline    String
hi link texMathSubEnvDel    PreProc
hi link texMathOperator     Operator
hi link texMathPunctuation  Operator
hi link texMathScopeDel     Delimiter
hi link texMathSpacing      Special
hi link texNewCmd           Statement
hi link texNewCmdArgNum     Delimiter
hi link texNewCmdArgNumNum  Number
hi link texNewCmdArgRef     Special
hi link texNewCmdEnv        PreProc
hi link texNewCmdName       Delimiter
hi link texNewCmdPunct      Operator
hi link texNewCmdMathDel    CustomType
hi link texOptionsEnv       Special
hi link texOptionsEnvDel    Statement
hi link texPkg              Statement
hi link texPkgOpt           Tag
hi link texPkgSty           Special
hi link texPkgStyDel        Delimiter
hi link texPunctuation      Operator
hi link texScopeDel         Delimiter
hi link texSpecialChar      SpecialChar
hi link texStatement        Statement
hi link texTag              Tag
hi link texTagLabel         Statement
hi link texTagRef           Statement
hi link texTagType          Statement
hi link texTitle            Statement
hi link texTitleBeamerFrame Statement
hi link texTitleLong        Title
hi link texTitleShort       Tag
hi link texTypeSize         Type
hi link texTypeStyle        Type
hi link texUrl              Statement
hi link texUrlScope         Tag
hi link texVerbDel          Delimiter

" Syncronization:

syntax sync fromstart

" End:

let b:current_syntax = "tex"

