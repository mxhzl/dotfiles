status -i || exit

set fish_greeting

set -gx FISH_FILE $__fish_config_dir/config.fish

set -gx CLICOLOR 1
set -gx TERM xterm-256color

command -q cargo && set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.bin $PATH
set -gx PATH $HOME/.local/bin $PATH

set -gx PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin" $PATH

test -e $HOME/.1password/agent.sock && set -gx SSH_AUTH_SOCK $HOME/.1password/agent.sock

set -gx fisher_path $__fish_config_dir/fisher

if command -q hx
    set -x EDITOR hx
else
    set -x EDITOR vim
end

set -x VISUAL $EDITOR

if command -q starship
    # starship init fish --print-full-init | source
    # enable_transience
end

if command -q zoxide
    zoxide init fish | source
    abbr cd z
end

if command -q chezmoi
    abbr cz chezmoi
    abbr cza chezmoi apply
    abbr czu chezmoi update
    abbr cze chezmoi edit -a
    abbr czef chezmoi edit -a $FISH_FILE
end

command -q jj && jj util completion fish | source

abbr be bundle exec
abbr rf source $FISH_FILE
abbr ef $EDITOR $FISH_FILE
abbr cp cp -iv
abbr gst git status
abbr mkdir mkdir -p
abbr mv mv -iv
abbr rm rm -iv

command -q codium && abbr c codium -n
command -q subl && abbr s subl --launch-or-new-window

if test -e $__fish_config_dir/config.fish.local
    source $__fish_config_dir/config.fish.local
end
