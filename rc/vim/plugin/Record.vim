" Vim file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2016 Abr 11 17:30:10
"
" About:         Records matches for later use

"===============================================================================

autocmd BufEnter,BufRead * :call RecReset()

fun RecReset()
    let b:rec_list = []
    let b:rec_idx = 0
endfun

fun RecSet(pattern, ...)
    let line_start = a:0 >= 1 ? a:1 : '1'
    let line_end = a:0 >= 2 ? a:2 : '$'
    let cursor_pos = getpos(".")
    exe line_start.';'.line_end.'s/'.a:pattern.'/\=RecAdd(submatch(0))/'
    call setpos(".", cursor_pos)
endfun

fun RecAdd(match)
    call add(b:rec_list, a:match)
    return a:match
endfun

fun RecGet(idx)
    return get(b:rec_list, a:idx)
endfun

fun RecPrint(...)
    let before = a:0 >= 1 ? a:1 : ''
    let after = a:0 >= 2 ? a:2 : ''
    for item in b:rec_list
        exe 'normal o'.before.item.after
    endfor
endfun

fun RecIdx(...)
    let before = a:0 >= 1 ? a:1 : ''
    let after = a:0 >= 2 ? a:2 : ''
    let out = before.b:rec_idx.after
    let b:rec_idx += 1
    return out
endfun

