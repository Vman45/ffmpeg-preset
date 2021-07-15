_movie2gif-360() {
    local folder file
    _init_completion -s || return

    local defaultIFS=$' \t\n'
    local IFS=$defaultIFS

    case $cword in
        1)
            COMPREPLY=( $(compgen -W 'folder file' -- "$cur") )
            ;;
        *)
            case ${words[1]} in
                edit)
                    IFS=$'\n'; COMPREPLY=( $(compgen -W '$(note list)' -- "$cur") ); IFS=$defaultIFS
                    ;;
                remove)
                    IFS=$'\n'; COMPREPLY=( $(compgen -W '$(note list)' -- "$cur") ); IFS=$defaultIFS
                    ;;
                list)
                    ;;
            esac
            ;;
    esac
}

# 2. 補完関数とコマンドの結びつけ
complete -F _movie2gif-360 movie2gif-360
