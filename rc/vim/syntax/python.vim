" Vim syntax file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2018 dez 09 11:17:59
"
" Language:      Python 3

if exists("b:current_syntax")
    finish
endif

syntax clear

" Keywods:

syntax keyword pythonConditional if elif else
syntax keyword pythonConstant    True False None
syntax keyword pythonException   try except finally raise
syntax keyword pythonInclude     from import
syntax keyword pythonOperator    is in not and or
syntax keyword pythonRepeat      while for
syntax keyword pythonStatement   return assert pass continue break with global
            \ nonlocal yield as async await

syntax keyword pythonLambda   lambda
syntax keyword pythonClass    class nextgroup=pythonClassName skipwhite
syntax keyword pythonFunction def nextgroup=pythonFuncName skipwhite

" Todo:

syntax keyword pythonTodo TODO FIXME XXX contained

" Builtin Exceptions And Warnings:

syntax keyword pythonExClass BaseException
            \ Exception StandardError ArithmeticError
            \ LookupError EnvironmentError
            \ AssertionError AttributeError BufferError EOFError
            \ FloatingPointError GeneratorExit IOError
            \ ImportError IndexError KeyError
            \ KeyboardInterrupt MemoryError NameError
            \ NotImplementedError OSError OverflowError
            \ ReferenceError RuntimeError StopIteration
            \ SyntaxError IndentationError TabError
            \ SystemError SystemExit TypeError
            \ UnboundLocalError UnicodeError
            \ UnicodeEncodeError UnicodeDecodeError
            \ UnicodeTranslateError ValueError VMSError
            \ WindowsError ZeroDivisionError
            \ Warning UserWarning BytesWarning DeprecationWarning
            \ PendingDepricationWarning SyntaxWarning
            \ RuntimeWarning FutureWarning
            \ ImportWarning UnicodeWarning

" Builtins And Others:

syntax keyword pythonSelf self cls

syntax keyword pythonBuiltin __import__ abs all any ascii bin bool bytearray
            \ bytes callable chr classmethod compile complex
            \ delattr dict dir divmod enumerate eval exec
            \ filter float format frozenset getattr globals
            \ hasattr hash help hex id input int isinstance
            \ issubclass iter len list locals map max
            \ memoryview min next object oct open ord pow print
            \ property range repr reversed round set setattr
            \ slice sorted staticmethod str sum super tuple
            \ type vars zip
            \ nextgroup=pythonFuncParens

" Function Call:

syntax match pythonIdentifier "\h\w*" nextgroup=pythonFuncParens

" Line Continuation:

syntax match pythonLineContinuation "\\$"

" Operators:

syntax match pythonDot "\d\@<!\."
syntax match pythonComma ","
syntax match pythonColon ":"
syntax match pythonOperator "[+=*/^~!&|/%><-]"

" String Escape Sequences:

syntax match pythonStringEscape "\\\%($\|\\\|\'\|\"\|[abfnrtv]\|\o\{1,3}\|x\x\{1,2}\|N{\a\+\%(\s\a\+\)*}\|\u\x\{4}\|\U\x\{8}\)" contained

syntax match pythonStringRawEscape "\\." contained

" String Format:

syntax match pythonStringFormat "{{\|}}" contained
syntax match pythonStringFormat "{\%(\h\w*\%(\.\h\w*\|\[\%(\d\+\|[^\]]*\)]\)*\|\d\+\)\=\%(![rsa]\)\=\%(:\%(.[<>=^]\)\=[+ -]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\)\=}" contained

syntax match pythonStringFormating "%\(([^)]\+)\)\=[-#0 +]*\d*\(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrsa%]" contained
syntax match pythonStringFormating "%[-#0 +]*\(\*\|\d\+\)\=\(\.\(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrsa%]" contained

syntax match pythonStringTemplate "$\%($\|\h\w*\|{\h\w*}\)" contained

syntax cluster pythonStringContains contains=pythonStringEscape,pythonStringFormat,pythonStringFormating,pythonStringTemplate,

" Strings:

syntax region pythonString matchgroup=pythonDelimiter start="[uU]\=\"" end="\"" contains=@pythonStringContains
syntax region pythonString matchgroup=pythonDelimiter start="[uU]\=\'" end="\'" contains=@pythonStringContains

syntax region pythonStringTriple matchgroup=pythonDelimiter start="[uU]\=\"\"\"" end="\"\"\"" contains=@pythonStringContains
syntax region pythonStringTriple matchgroup=pythonDelimiter start="[uU]\=\'\'\'" end="\'\'\'" contains=@pythonStringContains

syntax region pythonStringRaw matchgroup=pythonDelimiter start="[rR]\"" end="\"" contains=pythonStringRawEscape
syntax region pythonStringRaw matchgroup=pythonDelimiter start="[rR]\'" end="\'" contains=pythonStringRawEscape

syntax region pythonStringRawTriple matchgroup=pythonDelimiter start="[rR]\"\"\"" end="\"\"\"" contains=pythonStringRawEscape
syntax region pythonStringRawTriple matchgroup=pythonDelimiter start="[rR]\'\'\'" end="\'\'\'" contains=pythonStringRawEscape

" Bytes:

syntax match pythonBytesEscape "\\." contained

syntax region pythonBytes matchgroup=pythonDelimiter start="\([bB][Rr]\=\|[rR][bB]\)\"" end="\"" contains=pythonBytesEscape
syntax region pythonBytes matchgroup=pythonDelimiter start="\([bB][Rr]\=\|[rR][bB]\)\'" end="\'" contains=pythonBytesEscape

syntax region pythonBytesTriple matchgroup=pythonDelimiter start="\([bB][Rr]\=\|[rR][bB]\)\"\"\"" end="\"\"\"" contains=pythonBytesEscape
syntax region pythonBytesTriple matchgroup=pythonDelimiter start="\([bB][Rr]\=\|[rR][bB]\)\'\'\'" end="\'\'\'" contains=pythonBytesEscape

" DocTest:

" TODO

" Parentheses And Regions:

syntax match pythonBadParentheses ")"
syntax match pythonBadCurly       "}"
syntax match pythonBadBrackets    "\]"

syntax cluster pythonNotContained contains=pythonFuncName,pythonFuncArguments,pythonFunction,pythonClassName,pythonClassArguments,pythonClass,pythonTodo,@pythonStringContains,pythonStringRawEscape,pythonBytesEscape,pythonDecoratorArg,pythonDecorator,pythonCommentTitle,pythonShebang,pythonEncoding

syntax region pythonParentheses matchgroup=pythonDelimiter start="("  end=")" transparent contains=ALLBUT,pythonBadParentheses,@pythonNotContained,pythonFuncParameter
syntax region pythonCurly       matchgroup=pythonOperator start="{"  end="}"  transparent contains=ALLBUT,pythonBadCurly,@pythonNotContained,pythonFuncParameter
syntax region pythonBrackets    matchgroup=pythonOperator  start="\[" end="\]" transparent contains=ALLBUT,pythonBadBrackets,@pythonNotContained,pythonFuncParameter

" Decorators:

syntax match pythonDecorator "@" nextgroup=pythonDecoratorArg skipwhite

syntax match pythonDecoratorArg "\h\w*\%(\.\h\w*\)*" contained contains=pythonDot nextgroup=pythonFuncParens skipwhite

" Function Arguments:

syntax match pythonColon ":" contained

syntax region pythonFuncParens matchgroup=pythonDelimiter start="(" end=")" contained transparent nextgroup=pythonColon skipwhite contains=ALLBUT,pythonBadParentheses,@pythonNotContained

syntax match pythonFuncParameter "\h\w*\ze=" contained

syntax match pythonFuncName "\h\w*" contained nextgroup=pythonFuncParens,pythonColon

" Class Arguments:

syntax region pythonClassParens matchgroup=pythonDelimiter start="(" end=")" contained transparent nextgroup=pythonColon skipwhite

syntax match pythonClassName "\h\w*" contained nextgroup=pythonClassParens,pythonColon

" Numbers:

syntax match pythonInteger "\<0[oO]\o*\>"
syntax match pythonInteger "\<0[xX]\x*\>"
syntax match pythonInteger "\<0[bB][01]*\>"

syntax match pythonFloat "\<\d\+\(\.\d*\)\=\%([eE][+-]\=\d\+\)\=[jJ]\=\ze\(\W\|$\)"
syntax match pythonFloat "\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"

" Errors:

syntax match pythonBadOperator "[$?]"
syntax match pythonBadOperator "[&|]\{2,}"
syntax match pythonBadOperator "[=><]\{3,}"

" Comment:

syntax match pythonCommentTitle "#\s*\zs\%(\%(\w\|-\|\.\)\+\s*\)\+:\ze\%(\s\|$\)" contained

syntax match pythonComment "#.*$" contains=pythonTodo,pythonCommentTitle,@Spell

syntax match pythonCommentStart "\%^#\%(.*\n#\)\=.*$" contains=pythonTodo,pythonCommentTitle,@Spell,pythonShebang,pythonEncoding

syntax match pythonShebang "\%^#!.*$" contained

syntax match pythonEncoding "^#.*coding[:=].*$" contained

" Highlight:

hi link pythonBadBrackets           Error
hi link pythonBadCurly              Error
hi link pythonBadOperator           Error
hi link pythonBadParens             Error
hi link pythonBuiltin               Statement
hi link pythonClass                 Statement
hi link pythonClassName             Function
hi link pythonCoding                Statement
hi link pythonColon                 Operator
hi link pythonComma                 Delimiter
hi link pythonComment               Comment
hi link pythonCommentStart          Comment
hi link pythonCommentTitle          CommentTitle
hi link pythonConditional           Conditional
hi link pythonConstant              Constant
hi link pythonDecorator             Statement
hi link pythonDecoratorArg          Type
hi link pythonDelimiter             Delimiter
hi link pythonDot                   Operator
hi link pythonEncoding              Statement
hi link pythonExClass               Statement
hi link pythonException             Statement
hi link pythonFloat                 Float
hi link pythonFuncName              Function
hi link pythonFuncParameter         Tag
hi link pythonFunction              Statement
hi link pythonIdentifier            Normal
hi link pythonInclude               Include
hi link pythonInteger               Integer
hi link pythonLambda                Statement
hi link pythonLineContinuation      Special
hi link pythonOperator              Operator
hi link pythonRepeat                Repeat
hi link pythonSelf                  Macro
hi link pythonShebang               Statement
hi link pythonSpecialName           Special
hi link pythonStatement             Statement
hi link pythonString                String
hi link pythonStringEscape          Special
hi link pythonStringFormat          Special
hi link pythonStringFormating       Special
hi link pythonStringTemplate        Special
hi link pythonStringTriple          String
hi link pythonStringTriple          String
hi link pythonStringRaw             Tag
hi link pythonStringRawTriple       Tag
hi link pythonTodo                  Todo

" Syncronization:

syntax sync match pythonSync grouphere NONE "^\s*\%(def\|class\)\s"

" End:

let b:current_syntax = "cpp"
