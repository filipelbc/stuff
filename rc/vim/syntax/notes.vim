" Vim syntax file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2016 Jul 13 16:54:16
"
" Language:      My Own Notes File

if exists("b:current_syntax")
    finish
endif

syntax clear

" Regions:
syntax region notesTopicA matchgroup=notesBullet start="^\s*# " end="$"
syntax region notesTopicB matchgroup=notesBullet start="^\s*## " end="$"
syntax region notesTopicC matchgroup=notesBullet start="^\s*### " end="$"
syntax region notesTopicD matchgroup=notesBullet start="^\s*#### " end="$"

syntax match notesBullet "^\s*\(-\|\*\|>\|\~\|+\) "

syntax match notesEnumA "^\s*\(\d\+\|\a\)\(\.\|-\) "

syntax match notesEnumB "^\s*\(\d\+\|\a\)\.\(\d\+\|\a\)\(\.\|-\)\= "

syntax region notesParens matchgroup=notesDelimiter start="(" end=")" contains=notesDelimiter,notesArrow transparent
syntax region notesParens matchgroup=notesDelimiter start="\[" end="]" contains=notesDelimiter,notesArrow transparent
syntax region notesParens matchgroup=notesDelimiter start="{" end="}" contains=notesDelimiter,notesArrow transparent

" Separation:
syntax match notesSep "^-\+$"
syntax match notesSep "^=\+$"

" Others:
syntax match notesSign " <\=-->\= "

syntax match notesSign "\(?\|!\)"

syntax match notesTodo "TODO"
syntax match notesTodo "FIXME"
syntax match notesTodo "NOTE"

" Highlights:

hi link notesTopicA             Identifier
hi link notesTopicB             String
hi link notesTopicC             Special
hi link notesTopicD             Statement

hi link notesBullet             Delimiter

hi link notesEnumA              Delimiter
hi link notesEnumB              Delimiter

hi link notesSign              Operator

hi link notesSep                Comment

hi link notesTodo               Todo

" Synchronization:

syntax sync fromstart

" End:

let b:current_syntax = "notes"

