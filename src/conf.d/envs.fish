if status is-interactive
    set -q LESS || set -x LESS '--mouse --wheel-lines=3'
    set -x EDITOR hx
    set -x GPG_TTY (tty)
    set -x HELM_DIFF_COLOR true
    set -x HELM_DIFF_OUTPUT dyff
    set -x KUBE_EDITOR hx
    set -x PAGER 'less -rXF'
end
