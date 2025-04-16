# Attach or create zellij session named the same as current directory.
function zat
    command -q zellij || return

    set path_name (basename $PWD)

    if test -z "$ZELLIJ"
        zellij attach -c "$path_name"
    end
end
