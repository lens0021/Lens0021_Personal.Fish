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
    abbr -a -- zz 'z (zoxide query -i)'
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

    abbr -a -- fw-aws-sso 'aws --profile fw configure sso'
    abbr -a -- fw-ec2 'aws --profile fw --region ap-northeast-1 ec2 describe-instances --query "Reservations[*].Instances[*].[to_string(Tags), State.Name, InstanceId, PrivateIpAddress, LaunchTime]" --output table'

end
