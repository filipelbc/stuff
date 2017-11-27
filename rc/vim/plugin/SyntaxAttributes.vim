" Vim plugin file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2016 Abr 11 17:27:17
"
" Original Version:
"
"   Gary Holloway
"   https://github.com/vim-scripts/SyntaxAttr.vim

"===============================================================================
" Main:

fun SyntaxAttributes()
    let id = ""
    let fg = ""
    let bg = ""
    let sty = ""

    let id1 = synID(line("."), col("."), 1)
    let id1t = synIDtrans(id1)

    if synIDattr(id1,"name") != ""
        let id = synIDattr(id1,"name")
        if( id1 != id1t )
            let id = id . '->' . synIDattr(id1t,"name")
        endif
        let id0 = synID(line("."), col("."), 0)
        if( synIDattr(id0,"name") != synIDattr(id1,"name") )
            let id = id . " (" . synIDattr(id0,"name")
            let id0t = synIDtrans(id0)
            if( id0t != id0 )
                let id = id . '->' . synIDattr(id0t,"name")
            endif
            let id = id . ")"
        endif
    endif

    if( synIDattr(id1t,"bold") != "" )
        let sty = sty . ",bold"
    endif

    if( synIDattr(id1t,"italic") != "" )
        let sty = sty . ",italic"
    endif

    if( synIDattr(id1t,"reverse") != "" )
        let sty = sty . ",reverse"
    endif

    if( synIDattr(id1t,"inverse") != "" )
        let sty = sty . ",inverse"
    endif

    if( synIDattr(id1t,"standout") != "" )
        let sty = sty . ",standout"
    endif

    if( synIDattr(id1t,"underline") != "" )
        let sty = sty . ",underline"
    endif

    if( synIDattr(id1t,"undercurl") != "" )
        let sty = sty . ",undercurl"
    endif

    if( sty != "" )
        let sty = substitute(sty, "^,", "  sty=", "")
    endif

    if( synIDattr(id1t,"fg") != "" )
        if( synIDattr(id1t,"fg") == "-1" )
            let fg = "  fg=NONE"
        else
            let fg = "  fg=" . synIDattr(id1t,"fg")
        endif
    endif

    if( synIDattr(id1t,"bg") != "" )
        if( synIDattr(id1t,"bg") == "-1" )
            let bg = "  bg=NONE"
        else
            let bg = "  bg=" . synIDattr(id1t,"bg")
        endif
    endif

    let msg = id . sty . fg . bg
    if( msg == "" )
        let msg = "None"
    endif
    echohl MoreMsg
    echo msg
    echohl None
endfun

