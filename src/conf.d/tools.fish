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

    # https://github.com/yazi-rs/yazi-rs.github.io/blob/91959553ff7cc7720d8aedbd35e7adb01a7f8325/docs/quick-start.md?plain=1#L40-L49
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    function Y
        set yazi_config_home "$YAZI_CONFIG_HOME"
        if test -z "$yazi_config_home"
            set yazi_config_home ~/.config/yazi/
        end

        set temp_yazi_config_home (mktemp -d -t "yazi-cwd.XXXXXX")
        if test -d $yazi_config_home
            rsync -a $yazi_config_home $temp_yazi_config_home
        end
        rsync -a ~/.config/abyazelix/yazi/sidebar/ $temp_yazi_config_home

        set tmp (mktemp -t "yazi-cwd.XXXXXX" --tmpdir="$temp_yazi_config_home")
        YAZI_CONFIG_HOME=$temp_yazi_config_home yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -rf -- "$temp_yazi_config_home"
    end

    if type zoxide &>/dev/null
        zoxide init fish | source
    end

    if type starship &>/dev/null
        starship init fish | source
    end

    if set -q KREW_ROOT
        set -gx PATH $PATH $KREW_ROOT/.krew/bin
    else
        set -gx PATH $PATH $HOME/.krew/bin
    end
end
