" Vim plugin file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2018 fev 11 19:07:20

"===============================================================================
" Main:

autocmd BufWritePre * :call OnSave()

let g:ignore_ft = ['diff', 'python', 'json', 'js']

function OnSave()
    if &modified
        " save cursor position
        let cursor_pos = getpos(".")

        " not on all filetypes
        if index(g:ignore_ft, &filetype) < 0
            " remove trailing spaces
            keeppatterns %s/\s\+$//e
            " ensure no empty line at end-of-file
            keeppatterns %s/\n*\%$//e
            " remove excess empty lines
            keeppatterns %s/\n\{3,}/\r\r/e
        endif

        " update header info
        let n = min([20, line("$")])
        execute 'keeppatterns 1,' . n . 's/^\(.\{,10}Last Change:\s*\).*/\1' . strftime('%Y %b %d %T') . '/e'

        " restore cursor position
        call setpos(".", cursor_pos)
    endif
endfunction
