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
