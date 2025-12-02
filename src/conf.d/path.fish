if status is-login
    if test -z $ASDF_DATA_DIR
        set _asdf_shims "$HOME/.asdf/shims"
    else
        set _asdf_shims "$ASDF_DATA_DIR/shims"
    end
    if not contains $_asdf_shims $PATH
        set -gx --prepend PATH $_asdf_shims
    end
    set --erase _asdf_shims

    set -gx PATH $PATH $HOME/.local/bin
    set -gx PATH $PATH $HOME/go/bin
    set -gx PATH $PATH $HOME/.composer/vendor/bin
    set -gx PATH $PATH $HOME/bin
    set -gx PATH $PATH $HOME/.cargo/bin/
    set -gx PATH $PATH $HOME/.bun/bin
    if set -q KREW_ROOT
        set -gx PATH $PATH $KREW_ROOT/bin
    else if test -d $HOME/.krew/bin
        set -gx PATH $PATH $HOME/.krew/bin
    end
end
