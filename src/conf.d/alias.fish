if status is-interactive
    # Commands to run in interactive sessions can go here
    if set -q TERMUX_VERSION
        alias aws 'proot-distro login --shared-tmp --termux-home --user nemo fedora -- aws'
    end
end
