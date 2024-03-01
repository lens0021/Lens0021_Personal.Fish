if status is-interactive
  # Commands to run in interactive sessions can go here

  abbr -a -- pbcopy 'xclip -selection clipboard'
  abbr -a -- pbpaste 'xclip -selection clipboard -o'
  abbr -a -- kc kubectl
  abbr -a -- tf terraform
  abbr tjp --set-cursor 'tmux join-pane -s% -t'

  abbr -a -- gco 'git checkout'
  abbr -a -- gitdelta 'git -c \'core.pager=delta --light -s\''
  abbr -a -- gitgraph 'git log --graph --all --decorate --oneline --color'
  abbr -a -- gitgraphfzf "git log --graph --all --decorate --oneline --color | fzf --multi --tiebreak=index --layout reverse --ansi --no-sort --preview 'echo {} | rg --only-matching --max-count 1 '[0-9a-f]\\\\{7\\\\}' | xargs -I % sh -c \'git show --color=always \\%\'' | rg '[0-9a-f]{7}' --only-matching --max-count 1"
end
if status is-login
  set -gx PATH $PATH $HOME/.local/bin
  set -gx PATH $PATH $HOME/go/bin
  set -gx PATH $PATH $HOME/.composer/vendor/bin
  set -gx PATH $PATH $HOME/bin
  if set -q KREW_ROOT
    set -gx PATH $PATH $KREW_ROOT/bin
  else if test -d $HOME/.krew/bin
    set -gx PATH $PATH $HOME/.krew/bin
  end
end
