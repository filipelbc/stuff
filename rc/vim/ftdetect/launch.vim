" Vim ftdetect file
"
" Author:        Filipe L B Correia <filipelbc@gmail.com>
" Last Change:   2016 Jul 02 12:43:02
"
" About:         Detect .launch files of ROS

autocmd BufRead,BufNewFile *.launch set filetype=xml

