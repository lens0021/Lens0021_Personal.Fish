if status is-interactive
    # Commands to run in interactive sessions can go here

    if ! command -v pbcopy >/dev/null
        if command -v termux-clipboard-set >/dev/null
            abbr -a -- pbcopy termux-clipboard-set
            abbr -a -- pbpaste termux-clipboard-get
        else if command -v xclip >/dev/null
            abbr -a -- pbcopy 'xclip -selection clipboard'
            abbr -a -- pbpaste 'xclip -selection clipboard -o'
        end
    end
    abbr -a -- kc kubectl
    abbr -a -- ic istioctl
    abbr -a -- tf terraform

    abbr -a -- gco 'git checkout'
    abbr -a -- gitdelta 'git -c \'core.pager=delta -s\''
    abbr -a -- gitgraph 'git log --graph --all --decorate --oneline --color'
    abbr -a -- gitgraphfzf "git log --graph --all --decorate --oneline --color | fzf --multi --tiebreak=index --layout reverse --ansi --no-sort --preview 'echo {} | rg --only-matching --max-count 1 '[0-9a-f]\\\\{7\\\\}' | xargs -I % sh -c \'git show --color=always \\%\'' | rg '[0-9a-f]{7}' --only-matching --max-count 1"

    abbr -a --set-cursor -- gotemp 'bash -c \'cat <<EOF > temp.go
package main

import "fmt"
func main() {
    %
}
EOF
go run temp.go
rm temp.go\'
'

end
if status is-interactive

    bind --mode default \cL lazygit

end
if status is-interactive
    set -q LESS || set -x LESS '--mouse --wheel-lines=3'
    set -x EDITOR hx
    set -x GPG_TTY (tty)
    set -x HELM_DIFF_COLOR true
    set -x HELM_DIFF_OUTPUT dyff
    set -x KUBE_EDITOR hx
    set -x PAGER 'less -rXF'
end
if status is-login
    set -gx PATH $PATH $HOME/.local/bin
    set -gx PATH $PATH $HOME/go/bin
    set -gx PATH $PATH $HOME/.composer/vendor/bin
    set -gx PATH $PATH $HOME/bin
    set -gx PATH $PATH $HOME/.cargo/bin/
    if set -q KREW_ROOT
        set -gx PATH $PATH $KREW_ROOT/bin
    else if test -d $HOME/.krew/bin
        set -gx PATH $PATH $HOME/.krew/bin
    end
end
if status is-interactive
    if set -q TERMUX_VERSION
        tide configure --auto --style=Lean --prompt_colors='True color' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Compact --icons='Many icons' --transient=No
    end
end
if status is-interactive

    if functions -q fzf_configure_bindings
        # Change key bindings for fzf.fish
        # https://github.com/PatrickF1/fzf.fish/blob/main/functions/fzf_configure_bindings.fish
        fzf_configure_bindings --variables= --directory=\cv
    end

    if test -e ~/.asdf/asdf.fish
        source ~/.asdf/asdf.fish
    end

    if functions -q declair
        declair update_rc
    end

    if set -q TERMUX_VERSION
        # if function -q tide
        #   tide configure --auto --style=Lean --prompt_colors='True color' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Compact --icons='Many icons' --transient=No
        # end
    end

end
