" Vim ftplugin file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2016 Jul 02 12:39:54

"===============================================================================

" Quickfix:

nnoremap <F8>                   :silent make!\|redraw!\|vert cwindow<CR>
inoremap <F8>                   <esc>:silent make!\|redraw!\|vert cwindow<CR>

setlocal errorformat=%f:%l:%m,!%m

setlocal makeprg=pdflatex\ -file-line-error\ -shell-escape\ -halt-on-error\ -interaction=nonstopmode\ %

setlocal spell spelllang=pt,en,fr,de

setlocal textwidth=80

" Character Filter:

function! TexCharFilter()
    execute '%s/\%d171/<< /e'
    execute '%s/\%d187/ >>/e'
    execute '%s/\%d8211/--/e'
    execute '%s/\%d8212/---/e'
    execute '%s/\%d8213/---/e'
    execute '%s/\%d8216/`/e'
    execute '%s/\%d8217/''/e'
    execute '%s/\%d8220/``/e'
    execute '%s/\%d8221/''''/e'
    execute '%s/\(\%d8230\|\.\.\.\)/\\ldots{}/e'
endfunction

nnoremap <F3>       :call TexCharFilter()<CR>

" Make Environment:

inoremap <C-E>      <esc>^y$i\begin{<esc>$a}<CR>\end{<esc>pa}<esc>O

" Make Itemize:

inoremap <C-U>      <esc>{o\begin{itemize}<esc>}O\end{itemize}<esc>{v}:s/^\([^\\]\)/\\item \1/<CR>:noh<CR>{i
inoremap <C-O>      <esc>{o\begin{enumerate}<esc>}O\end{enumerate}<esc>{v}:s/^\([^\\]\)/\\item \1/<CR>:noh<CR>{i

nnoremap <C-U>      {o\begin{itemize}<esc>}O\end{itemize}<esc>{v}:s/^\([^\\]\)/\\item \1/<CR>:noh<CR>{
nnoremap <C-O>      {o\begin{enumerate}<esc>}O\end{enumerate}<esc>{v}:s/^\([^\\]\)/\\item \1/<CR>:noh<CR>{

