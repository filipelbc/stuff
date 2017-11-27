" Vim syntax file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2015 Out 06 15:30:05
"
" Language:      My Own Configuration File Format

"===============================================================================
" Intro:

if exists("b:current_syntax")
    finish
endif

syntax clear

"===============================================================================
" Separator:

syntax match cfgSeparator ";"

" Key:
syntax match cfgKeyNull  "\s*\zs[^;=\[{@]\(\\.\|#.*$\|\_[^;=\[{]\)\+\ze;" contains=cfgSpecial,cfgComment
syntax match cfgKeyString "\s*\zs[^;=\[{@]\(\\.\|#.*$\|\_[^;=\[{]\)\+\ze=" contains=cfgSpecial,cfgComment nextgroup=cfgString
syntax match cfgKeyArray  "\s*\zs[^;=\[{@]\(\\.\|#.*$\|\_[^;=\[{]\)\+\ze\[" contains=cfgSpecial,cfgComment nextgroup=cfgArray
syntax match cfgKeyGroup  "\s*\zs[^;=\[{@]\(\\.\|#.*$\|\_[^;=\[{]\)\+\ze{" contains=cfgSpecial,cfgComment nextgroup=cfgGroup

" Group:
syntax region cfgGroup matchgroup=cfgDelimiter start="{" end="}" contained contains=ALLBUT,cfgBoolean,cfgNumber,cfgCommentTitle,cfgTodo

" Array:
syntax region cfgArray matchgroup=cfgDelimiter start="\[" end="\]" contained contains=cfgGroup,cfgSeparator,cfgComment,cfgSpecial

" String:
syntax region cfgString matchgroup=cfgDelimiter start="=" end=";" contained contains=cfgBoolean,cfgNumber,cfgComment,cfgSpecial

" Input File:

syntax region cfgInputFile matchgroup=cfgDelimiter start="@" end=";" contains=cfgComment

" Numbers:

" [-]3[.[3]][e[+-]3]
syntax match cfgNumber "\(\s\|^\)-\=\d\+\(\.\d\+\)\=\(e[-+]\=\d\+\)\=\>" contained
" [-].3[e[+-]3]
syntax match cfgNumber "\(\s\|^\)-\=\.\d\+\(e[-+]\=\d\+\)\=\>" contained

" Booleans:

syntax keyword cfgBoolean true false on off yes no contained

" Comment:

syntax region cfgComment start="#" end="$" contains=cfgCommentTitle,cfgCommentTodo

syntax keyword cfgCommentTodo TODO FIXME XXX contained

syntax match cfgCommentTitle "\s*\zs\(\(\w\|-\|\.\)\+\s*\)\+:\ze\(\s\|$\)" contained

" Special Character:

syntax match cfgSpecial "\\." contained

" Highlights:

hi link cfgBoolean             Boolean
hi link cfgComment             Comment
hi link cfgCommentTitle        CommentTitle
hi link cfgCommentTodo         Todo
hi link cfgDelimiter           Delimiter
hi link cfgInputFile           Identifier
hi link cfgKeyArray            Type
hi link cfgKeyGroup            Structure
hi link cfgKeyNull            Tag
hi link cfgKeyString           String
hi link cfgNumber              Number
hi link cfgSeparator           Delimiter
hi link cfgSpecial             SpecialChar

" Synchronization:

syntax sync fromstart

" End:

let b:current_syntax = "cfg"

