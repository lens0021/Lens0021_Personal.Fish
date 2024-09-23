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
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

end
