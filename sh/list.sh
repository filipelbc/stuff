# Bash script file
#
# Author:        Filipe L B Correia <filipelbc@gmail.com>
# Last Change:   2020 Oct 10 22:59:28
#
# About:         functions for directory listing after cd'ing

#===============================================================================
# Options:

list_show_hidden=0  # don't show hidden files
list_show_details=0 # don't show files' details
list_show_sizes=0   # don't show files' sizes

if [ -n "$has_color" ]; then
    list_color_normal="\033[0m"
    list_color_line="\033[0m"
    list_color_dir="\033[1;31m"
fi

#===============================================================================
# Helpers:

list_hidden () {
    list_show_hidden=$(( 1 - list_show_hidden ))
    list
}

list_details () {
    list_show_details=$(( 1 - list_show_details ))
    list
}

list_sizes () {
    list_show_sizes=$(( 1 - list_show_sizes ))
    list
}

list_print_line () {
    local c=${1:-"─"}

    echo -en $list_color_line
    eval "printf '%.s$c' {1..$COLUMNS}"
    echo -e $list_color_normal
}

list_print_ls () {
    local o=""

    if [ $list_show_details -eq 1 ]; then
        o="$o -lh"
    elif [ $list_show_sizes -eq 1 ]; then
        o="$o -sh"
    fi

    if [ $list_show_hidden -eq 1 ]; then
        o="$o -A"
    fi

    ls $o "$1"
}

list_print_pwd () {
    list_print_line
    list_print_ls "$(pwd)"
}

list_print_dir () {
    list_print_line
    local p=$(readlink -f "$1")
    echo -e $list_color_dir$p$list_color_normal
    list_print_line "-"
    list_print_ls "$p"
}

list_clear () {
    echo -en '\033[H\033[2J'
}

#===============================================================================
# Main:

list () {
    list_clear
    # list current directory if no argument is given
    if [ "$#" -eq 0 ]; then
        list_print_pwd
    else
        # list given directories
        for dir in "$@"
        do
            if [ -d "$dir" ]; then
                list_print_dir "$dir"
            fi
        done
    fi
    list_print_line
}

# call after cd'ing
PROMPT_COMMAND='[ "${list_wd=$PWD}" != "$PWD" ] && list; list_wd=$PWD'

#===============================================================================
# Aliases:

alias :l='list'
alias :hi='list_hidden'
alias :de='list_details'
alias :si='list_sizes'
