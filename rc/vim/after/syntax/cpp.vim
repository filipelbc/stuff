" Vim syntax file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2015 Out 10 13:57:34
"
" Language:      C++

"===============================================================================
" My Names:

syntax keyword cppMyNamespace Traits Alg Math Utils BibMan

syntax keyword cppMyTypename T

syntax keyword cppMyType ArrayView Array StringView String
                        \ InputString
                        \ Tracer
                        \ Timer
                        \ StaticVector SVec Vector Vec Matrix Mat
                        \ RingBuffer
                        \ Value Entry Config

syntax keyword cppMyEnum Type IntFmt BoolFmt

syntax keyword cppMyType Maker

syntax keyword cppMyType Robot Reference Formation Neighbor
                        \ HighLevel LowLevel
                        \ Strategy
                        \ Vec3D Vec2D
                        \ Pose OmniVel DiffVel

syntax keyword cppMyAssert TRACER_FUN TRACER_PIN TRACER_WARN TRACER_FATAL

"===============================================================================
" C Library:

syntax match cppStd "\(^\|\s\)::\w\+\(::\w\+\)*\>"

"===============================================================================
" Standard Library:

syntax match cppStd "\<std::\w\+\(::\w\+\)*\>"

"===============================================================================
" Gtk Plus:

syntax match cppGtkCast "\<G\([TD]K\)\=\(_\u\+\)\+\>"

syntax keyword cppGtkCast GINT_TO_POINTER GPOINTER_TO_INT

syntax match cppGtkType "\<G\([td]k\)\=\(\u\l\+\)\+\>"

"===============================================================================
" Other Types:

syntax match cppOtherType "\<\w\+_t\>"

"===============================================================================
" Highlight:

hi link cppMyAssert                 Function
hi link cppMyEnum                   CustomType
hi link cppMyNamespace              CustomType
hi link cppMyType                   CustomType
hi link cppMyTypename               CustomType

hi link cppStd                      Special

hi link cppGtkCast                  Define
hi link cppGtkType                  Type

hi link cppOtherType                Type

