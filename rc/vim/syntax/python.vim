" Vim syntax file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2021 Sep 22 13:17:32
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
syntax keyword pythonStatement
            \ as
            \ assert
            \ async
            \ await
            \ break
            \ continue
            \ global
            \ nonlocal
            \ pass
            \ return
            \ with
            \ yield

syntax keyword pythonLambda   lambda
syntax keyword pythonClass    class nextgroup=pythonClassName skipwhite
syntax keyword pythonFunction def nextgroup=pythonFuncName skipwhite

" Todo:

syntax keyword pythonTodo TODO FIXME XXX contained

" Builtin Exceptions And Warnings:

syntax keyword pythonExClass
            \ ArithmeticError
            \ AssertionError
            \ AttributeError
            \ BaseException
            \ BufferError
            \ BytesWarning
            \ DeprecationWarning
            \ EOFError
            \ EnvironmentError
            \ Exception
            \ FloatingPointError
            \ FutureWarning
            \ GeneratorExit
            \ IOError
            \ ImportError
            \ ImportWarning
            \ IndentationError
            \ IndexError
            \ KeyError
            \ KeyboardInterrupt
            \ LookupError
            \ MemoryError
            \ NameError
            \ NotImplementedError
            \ OSError
            \ OverflowError
            \ PendingDepricationWarning
            \ ReferenceError
            \ RuntimeError
            \ RuntimeWarning
            \ StandardError
            \ StopIteration
            \ SyntaxError
            \ SyntaxWarning
            \ SystemError
            \ SystemExit
            \ TabError
            \ TypeError
            \ UnboundLocalError
            \ UnicodeDecodeError
            \ UnicodeEncodeError
            \ UnicodeError
            \ UnicodeTranslateError
            \ UnicodeWarning
            \ UserWarning
            \ VMSError
            \ ValueError
            \ Warning
            \ WindowsError
            \ ZeroDivisionError

" Builtins And Others:

syntax keyword pythonSelf self cls

syntax keyword pythonBuiltin nextgroup=pythonFuncParens
            \ __import__
            \ abs
            \ all
            \ any
            \ ascii
            \ bin
            \ bool
            \ breakpoint
            \ bytearray
            \ bytes
            \ callable
            \ chr
            \ classmethod
            \ compile
            \ complex
            \ delattr
            \ dict
            \ dir
            \ divmod
            \ enumerate
            \ eval
            \ exec
            \ filter
            \ float
            \ format
            \ frozenset
            \ getattr
            \ globals
            \ hasattr
            \ hash
            \ help
            \ hex
            \ id
            \ input
            \ int
            \ isinstance
            \ issubclass
            \ iter
            \ len
            \ list
            \ locals
            \ map
            \ max
            \ memoryview
            \ min
            \ next
            \ object
            \ oct
            \ open
            \ ord
            \ pow
            \ print
            \ property
            \ range
            \ repr
            \ reversed
            \ round
            \ set
            \ setattr
            \ slice
            \ sorted
            \ staticmethod
            \ str
            \ sum
            \ super
            \ tuple
            \ type
            \ vars
            \ zip

" Function Call:

syntax match pythonIdentifier "\h\w*" nextgroup=pythonFuncParens

" Line Continuation:

syntax match pythonLineContinuation "\\$"

" Operators:

syntax match pythonDot "\d\@<!\."
syntax match pythonComma ","
syntax match pythonColon ":"
syntax match pythonOperator "[+=*/^~!&|/%><@-]"

" String Escape Sequences:

syntax match pythonStringEscape "\\\%($\|\\\|\'\|\"\|[abfnrtv]\|\o\{1,3}\|x\x\{1,2}\|N{\a\+\%(\s\a\+\)*}\|\u\x\{4}\|\U\x\{8}\)" contained

syntax match pythonStringRawEscape "\\." contained

" String Format:

syntax match pythonStringFormat "{{\|}}" contained
syntax match pythonStringFormat "{\%(\h\w*\%(\.\h\w*\|\[\%(\d\+\|[^\]]*\)]\)*\|\d\+\)\=\%(![rsa]\)\=\%(:\%(.[<>=^]\)\=[+ -]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\)\=}" contained

syntax match pythonStringFormating "%\(([^)]\+)\)\=[-#0 +]*\d*\(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrsa%]" contained
syntax match pythonStringFormating "%[-#0 +]*\(\*\|\d\+\)\=\(\.\(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrsa%]" contained

syntax cluster pythonStringContains contains=pythonStringEscape,pythonStringFormat,pythonStringFormating

" Strings:

syntax region pythonString matchgroup=pythonDelimiter start="[uU]\=\"" end="\"" contains=@pythonStringContains
syntax region pythonString matchgroup=pythonDelimiter start="[uU]\=\'" end="\'" contains=@pythonStringContains

syntax region pythonStringTriple matchgroup=pythonDelimiter start="[uU]\=\"\"\"" end="\"\"\"" contains=@pythonStringContains
syntax region pythonStringTriple matchgroup=pythonDelimiter start="[uU]\=\'\'\'" end="\'\'\'" contains=@pythonStringContains

syntax region pythonStringRaw matchgroup=pythonDelimiter start="[rR]\"" end="\"" contains=pythonStringRawEscape
syntax region pythonStringRaw matchgroup=pythonDelimiter start="[rR]\'" end="\'" contains=pythonStringRawEscape

syntax region pythonStringRawTriple matchgroup=pythonDelimiter start="[rR]\"\"\"" end="\"\"\"" contains=pythonStringRawEscape
syntax region pythonStringRawTriple matchgroup=pythonDelimiter start="[rR]\'\'\'" end="\'\'\'" contains=pythonStringRawEscape

" F Strings:

syntax region pythonFStringFormat matchgroup=pythonDelimiter start="{" end="}" contained contains=ALLBUT,pythonBadCurly,@pythonNotContained,pythonFuncParameter,pythonComment
syntax match pythonFStringFormat "{{\|}}" contained

syntax cluster pythonFStringContains contains=pythonStringEscape,pythonFStringFormat

syntax region pythonFString matchgroup=pythonDelimiter start="[fF]\"" end="\"" contains=@pythonFStringContains
syntax region pythonFString matchgroup=pythonDelimiter start="[fF]\'" end="\'" contains=@pythonFStringContains

syntax region pythonFStringTriple matchgroup=pythonDelimiter start="[fF]\"\"\"" end="\"\"\"" contains=@pythonFStringContains
syntax region pythonFStringTriple matchgroup=pythonDelimiter start="[fF]\'\'\'" end="\'\'\'" contains=@pythonFStringContains

syntax region pythonFStringRaw matchgroup=pythonDelimiter start="\([fF][Rr]\|[rR][fF]\)\"" end="\"" contains=pythonFStringFormat
syntax region pythonFStringRaw matchgroup=pythonDelimiter start="\([fF][Rr]\|[rR][fF]\)\'" end="\'" contains=pythonFStringFormat

syntax region pythonFStringRawTriple matchgroup=pythonDelimiter start="\([fF][Rr]\|[rR][fF]\)\"\"\"" end="\"\"\"" contains=pythonFStringFormat
syntax region pythonFStringRawTriple matchgroup=pythonDelimiter start="\([fF][Rr]\|[rR][fF]\)\'\'\'" end="\'\'\'" contains=pythonFStringFormat

" Bytes:

syntax match pythonBytesEscape "\\." contained

syntax region pythonBytes matchgroup=pythonDelimiter start="\([bB][Rr]\=\|[rR][bB]\)\"" end="\"" contains=pythonBytesEscape
syntax region pythonBytes matchgroup=pythonDelimiter start="\([bB][Rr]\=\|[rR][bB]\)\'" end="\'" contains=pythonBytesEscape

syntax region pythonBytesTriple matchgroup=pythonDelimiter start="\([bB][Rr]\=\|[rR][bB]\)\"\"\"" end="\"\"\"" contains=pythonBytesEscape
syntax region pythonBytesTriple matchgroup=pythonDelimiter start="\([bB][Rr]\=\|[rR][bB]\)\'\'\'" end="\'\'\'" contains=pythonBytesEscape

" Parentheses And Regions:

syntax match pythonBadParentheses ")"
syntax match pythonBadCurly       "}"
syntax match pythonBadBrackets    "\]"

syntax cluster pythonNotContained contains=
            \ pythonFuncName,
            \ pythonFuncArguments,
            \ pythonFunction,
            \ pythonClassName,
            \ pythonClassArguments,
            \ pythonClass,
            \ pythonTodo,
            \ @pythonStringContains,
            \ @pythonFStringContains,
            \ pythonStringRawEscape,
            \ pythonBytesEscape,
            \ pythonDecoratorArg,
            \ pythonDecorator,
            \ pythonCommentTitle,
            \ pythonShebang,
            \ pythonEncoding

syntax region pythonParentheses matchgroup=pythonDelimiter start="("  end=")" transparent contains=ALLBUT,pythonBadParentheses,@pythonNotContained,pythonFuncParameter
syntax region pythonCurly       matchgroup=pythonOperator start="{"  end="}"  transparent contains=ALLBUT,pythonBadCurly,@pythonNotContained,pythonFuncParameter
syntax region pythonBrackets    matchgroup=pythonOperator  start="\[" end="\]" transparent contains=ALLBUT,pythonBadBrackets,@pythonNotContained,pythonFuncParameter

" Decorators:

syntax match pythonDecorator "@\h\w*\%(\.\h\w*\)*" contains=pythonDot nextgroup=pythonFuncParens skipwhite

" Function Arguments:

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

syntax match pythonBadOperator "[$`?]"
syntax match pythonBadOperator "[&|]\{2,}"
syntax match pythonBadOperator "[=><]\{3,}"

" Comment:

syntax match pythonCommentTitle "#\s*\zs\%(\%(\w\|-\|\.\)\+\s*\)\+:\ze\%(\s\|$\)" contained

syntax match pythonComment "#.*$" contains=pythonTodo,pythonCommentTitle,@Spell

syntax match pythonCommentStart "\%^#\%(.*\n#\)\=.*$" contains=pythonTodo,pythonCommentTitle,@Spell,pythonShebang,pythonEncoding

syntax match pythonShebang "\%^#!.*$" contained

syntax match pythonEncoding "^#.*coding[:=].*$" contained

" Embedded:

"syntax include @SQL syntax/sql.vim
"
"syn region embeddedSql contains=@SQL containedin=pythonStringTriple contained
"    \ start="\v(ALTER|BEGIN|CALL|COMMENT|COMMIT|CONNECT|CREATE|DELETE|DROP|END|EXPLAIN|EXPORT|GRANT|IMPORT|INSERT|LOAD|LOCK|MERGE|REFRESH|RENAME|REPLACE|REVOKE|ROLLBACK|SELECT|SET|TRUNCATE|UNLOAD|UNSET|UPDATE|UPSERT)"
"    \ end=";"

" Highlight:

hi link pythonBadBrackets           Error
hi link pythonBadCurly              Error
hi link pythonBadOperator           Error
hi link pythonBadParentheses        Error
hi link pythonBuiltin               Statement
hi link pythonClass                 Statement
hi link pythonClassName             Function
hi link pythonColon                 Operator
hi link pythonComma                 Delimiter
hi link pythonComment               Comment
hi link pythonCommentStart          Comment
hi link pythonCommentTitle          CommentTitle
hi link pythonConditional           Conditional
hi link pythonConstant              Constant
hi link pythonDecorator             Type
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
hi link pythonStatement             Statement
hi link pythonString                String
hi link pythonStringTriple          String
hi link pythonStringEscape          Special
hi link pythonStringFormat          Special
hi link pythonStringFormating       Special
hi link pythonStringRaw             String
hi link pythonStringRawTriple       String
hi link pythonStringRawEscape       Special
hi link pythonFString               String
hi link pythonFStringTriple         String
hi link pythonFStringRaw            String
hi link pythonFStringRawTriple      String
hi link pythonFStringFormat         Special
hi link pythonTodo                  Todo

" Syncronization:

syntax sync match pythonSync grouphere NONE "^\s*\%(def\|class\)\s"

" End:

let b:current_syntax = "python"
