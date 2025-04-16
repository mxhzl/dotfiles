function nvim
    read -l -P "You just ran nvim, did you mean $EDITOR? [y/N] " confirm

    switch $confirm
        case y Y
            $EDITOR $argv
        case '' n
            command nvim $argv
    end
end
