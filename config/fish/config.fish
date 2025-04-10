status -i || exit

set fish_greeting

set -gx CLICOLOR 1
set -gx TERM xterm-256color
set -gx LS_COLORS bxExCxDxfxegedabagacaf
set -gx LS_COLORS "di=31:ln=1;34:so=1;32:pi=1;33:ex=35:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;45"

command -q cargo && set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.bin $PATH
set -gx PATH $HOME/.local/bin $PATH

test -e $HOME/.1password/agent.sock && set -gx SSH_AUTH_SOCK $HOME/.1password/agent.sock

set -gx fisher_path $__fish_config_dir/fisher

if command -q codium 
    set -x EDITOR codium -wn
    abbr c codium -n
end

if command -q starship
    starship init fish --print-full-init | source
    enable_transience
end

if command -q zoxide 
    zoxide init fish | source
    abbr cd z
end

abbr be bundle exec
abbr rf source $__fish_config_dir/config.fish
abbr cp cp -iv
abbr gst git status
abbr mkdir mkdir -p
abbr mv mv -iv
abbr rm rm -iv
abbr g git
abbr b brew

if test -e $__fish_config_dir/config.fish.local
    source $__fish_config_dir/config.fish.local
end