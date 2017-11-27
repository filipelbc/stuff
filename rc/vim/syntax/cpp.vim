" Vim syntax file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2016 Jul 17 14:50:48
"
" Language:      C++

if exists("b:current_syntax")
    finish
endif

syntax clear

" Goto Label:

syntax match cppGotoLabel "^\s*\zs\w\+\ze:\%($\|[^:]\)" contains=cppGotoLabelOp,cppAccess

" Keywords:

syntax keyword cppAccess        public protected private
syntax keyword cppAssert        static_assert
syntax keyword cppBoolean       true false
syntax keyword cppConcept       concept requires
syntax keyword cppConditional   if else switch
syntax keyword cppConstant      nullptr
syntax keyword cppException     try catch throw
syntax keyword cppFunMod        inline virtual override final noexcept explicit friend
syntax keyword cppLabel         case default
syntax keyword cppOperatorKey   and and_eq bitand bitor compl not not_eq or or_eq xor xor_eq
syntax keyword cppOperatorKey   decltype sizeof typeof typeid alignof alignas
syntax keyword cppRepeat        while for do
syntax keyword cppReserved      export
syntax keyword cppStatement     new delete this typedef operator using goto break return continue asm
syntax keyword cppStorageClass  constexpr alignas
syntax keyword cppStructure     class struct union enum typename namespace
syntax keyword cppTemplate      template
syntax keyword cppTodo          TODO FIXME XXX contained
syntax keyword cppType          unsigned signed short long void bool char wchar_t char16_t char32_t int float double
syntax keyword cppTypeMod       const volatile register extern mutable static auto thread_local
syntax keyword cppTypeOther     size_t

" Macros:

syntax keyword cppMacro         __LINE__ __FILE__ __DATE__ __TIME__
                            \   __PRETTY_FUNCTION__ __FUNCTION__
                            \   __STDC__ __STDC_VERSION__ __STDC_HOSTED__
                            \   __OBJC__ __ASSEMBLER__
                            \   __cplusplus __attribute__
                            \   __VA_ARGS__  NULL

" Other:

syntax match cppCast "\<\%(const\|static\|dynamic\|reinterpret\)_cast\s*\ze<"

" Line Continuation:

syntax match cppBadContinuation "\\.*"
syntax match cppGoodContinuation "\\$"

" Preprocessor:

syntax match cppInclude  "^\s*#\s*include\s\%(<[^>]*>\|\"[^"]*\"\)" contains=cppIncluded
syntax match cppIncluded "<[^>]*>" contained
syntax match cppIncluded "\"[^"]*\"" contained

syntax match cppDefine "^\s*#\s*define\s\+\h\w*\>" contains=cppDefined
syntax match cppDefined "\s\h\w*\>" contained

syntax match cppPreProc "^\s*#\s*\%(undef\|error\|pragma\|line\)\>"

syntax match cppPreCondit "^\s*#\s*\%(if\(def\|ndef\)\=\|elif\|else\|endif\)\>"

" Comments:

syntax region cppLineComment start="//" end="$" keepend contains=cppTodo,cppSpecialComment,cppCommentTitle
syntax region cppBlockComment start="/\*" end="\*/" contains=cppTodo,cppSpecialComment,cppCommentTitle

syntax region cppSpecialComment start="\"" end="\"" contained
syntax region cppSpecialComment start="\'\'" end="\'\'" contained

syntax match cppCommentTitle "//\s*\zs\%(\%(\w\|-\|\.\)\+\s*\)\+:\ze\%(\s\|$\)" contained

" Code Blocks And Delimiters:

syntax match cppBadParentheses ")"
syntax match cppBadCurly       "}"
syntax match cppBadBrackets    "\]"

syntax cluster cppNotContained contains=cppIncluded,cppDefined,cppSpecialComment,cppCharEscaped,cppFormat,cppCommentTitle,cppTodo,cppAccess,cppAttributeParen

syntax region cppParentheses matchgroup=cppDelimiter start="("  end=")"  contains=ALLBUT,cppBadParentheses,@cppNotContained,cppLabel
syntax region cppCurly       matchgroup=cppDelimiter start="{"  end="}"  contains=ALLBUT,cppBadCurly,@cppNotContained fold
syntax region cppBrackets    matchgroup=cppOperator  start="\[" end="\]" contains=ALLBUT,cppBadBrackets,@cppNotContained,cppLabel

syntax region cppAttributeParen transparent matchgroup=cppDelimiter start="("  end=")" contains=cppString contained
syntax region cppAttribute matchgroup=cppStatement start="\[\[" end="\]\]" contains=cppComma,cppAttributeParen

" Operators:

syntax match cppOperator "\w\@<=\."
syntax match cppOperator "\.\.\."
syntax match cppOperator "/\%(/\|*\)\@!"
syntax match cppOperator "[+=*/?:^~!&|/%><,-]"

" Other Delimiters:

syntax match cppGotoLabelOp ":" contained

syntax match cppNamespaceDel "::"

syntax match cppComma "," contained
syntax match cppDelimiter ";"

" Character Literal:

syntax match cppCharEscaped "\\\%(u\x\{4}\|U\x\{8}\|\o\{3}\|x\x\{2}\|[\'\"\?\\abfnrtv0]\)" contained

syntax match cppChar "\%(L\|u8\|u\|U\)\='\%(\\\(u\x\{4}\|U\x\{8}\|\o\{3}\|x\x\{2}\|[\'\"\?\\abfnrtv0]\)\|[^\\]\)'" contains=cppCharEscaped

" String Literals:

" %[flags][width][.precision][length]specifier
syntax match cppFormat "%[-+' #0*]*\%(\d*\|\*\)\=\(\.\%(\d*\|\*\)\)\=\%(hh\|ll\|[hlLjzt]\)\=[csdioxXufFeEaAgGnp]" contained
syntax match cppFormat "%%" contained

syntax region cppString    matchgroup=cppOperator start="\%(L\|u8\|u\|U\)\=\""  skip="\\\"" end="\"" contains=cppCharEscaped,cppFormat
syntax region cppStringRaw matchgroup=cppOperator start="\%(L\|u8\|u\|U\)\=R\"" skip="\\\"" end="\""

" Number Literals:

syntax case ignore

" 3
syntax match cppInteger "\<\%(0b[01]\+\|0x\x\+\|0\o\+\|\d\+\)\%(u\%(l\|ll\)\=\|\%(l\|ll\)u\=\)\=\>"
" 3[fl]
syntax match cppFloat "\<\d\+[lf]\>"
" 3.[3][e[+-]3][fl]
syntax match cppFloat "\<\d\+\.\d*\%(e[-+]\=\d\+\)\=[fl]\=\>"
" .3[e[+-]3][fl]
syntax match cppFloat "\.\d\+\%(e[-+]\=\d\+\)\=[fl]\=\>"
" 3e[+-]3[fl]
syntax match cppFloat "\<\d\+e[-+]\=\d\+[fl]\=\>"

syntax case match

" Highlights:

hi link cppAccess           Keyword
hi link cppAssert           Function
hi link cppAttribute        Function
hi link cppBadBrackets      Error
hi link cppBadContinuation  Error
hi link cppBadCurly         Error
hi link cppBadParentheses   Error
hi link cppBlockComment     Comment
hi link cppBoolean          Constant
hi link cppCast             Statement
hi link cppChar             Character
hi link cppCharEscaped      SpecialChar
hi link cppComma            Delimiter
hi link cppCommentTitle     CommentTitle
hi link cppConcept          Keyword
hi link cppConditional      Conditional
hi link cppConstant         Constant
hi link cppDefine           Define
hi link cppDefined          Identifier
hi link cppDelimiter        Delimiter
hi link cppException        Exception
hi link cppFloat            Float
hi link cppFormat           SpecialChar
hi link cppFunMod           StorageClass
hi link cppGoodContinuation Special
hi link cppGotoLabel        Tag
hi link cppGotoLabelOp      Operator
hi link cppInclude          Include
hi link cppIncluded         String
hi link cppInteger          Number
hi link cppLabel            Label
hi link cppLineComment      Comment
hi link cppMacro            Macro
hi link cppNamespaceDel     Special
hi link cppOperator         Operator
hi link cppOperatorKey      Operator
hi link cppPreCondit        PreCondit
hi link cppPreProc          PreProc
hi link cppRepeat           Repeat
hi link cppReserved         Keyword
hi link cppSpecialComment   SpecialComment
hi link cppStatement        Statement
hi link cppStorageClass     StorageClass
hi link cppString           String
hi link cppStringRaw        String
hi link cppStructure        Structure
hi link cppTemplate         Statement
hi link cppTodo             Todo
hi link cppType             Type
hi link cppTypeMod          Type
hi link cppTypeOther        Type

" Syncronization:

syntax sync fromstart

" End:

let b:current_syntax = "cpp"

