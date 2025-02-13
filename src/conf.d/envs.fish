if status is-interactive
    set -g fish_greeting
    set -q LESS || set -x LESS '--mouse --wheel-lines=3'
    set -x EDITOR hx
    set -x GPG_TTY (tty)
    set -x HELM_DIFF_COLOR true
    set -x HELM_DIFF_OUTPUT dyff
    set -x HELM_DIFF_USE_UPGRADE_DRY_RUN true
    set -x KUBE_EDITOR hx
    set -x PAGER 'less -rXF'
    set -x TF_PLUGIN_CACHE_DIR "$HOME/.terraform.d/plugin-cache"
end
