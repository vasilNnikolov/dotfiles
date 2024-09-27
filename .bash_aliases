alias l='ls -lAhtr'
alias lsd='ls /dev/ttyUSB*'
alias cl='clear'
alias cls='clear'
alias asd='xdg-open'

cd_multiple_dots(){
    if [[ $# -eq 1  && "$1" =~ ^\.{3,}$ ]]; then
        dots="$1"
        n_dots=${#dots}
        path=""
        for ((i=1; i < $n_dots; i++)); do
            path+="../"
        done
        cd $path
    else
        cd "$@"
    fi
}
alias cd='cd_multiple_dots'
alias asd='xdg-open'

# git related aliases
alias gs='git status'
alias ga='git add'
alias gcm='git commit -m'
alias gc='git commit'
alias gck='git checkout'
alias gd='git diff --ignore-space-at-eol'
alias gds='git diff --ignore-space-at-eol --staged'


if [ $(($RANDOM % 10)) -eq 0 ]; then
    MESSAGE='CASINO TIME'
    if [ -n "$(which cowsay)" ]; then
        cowsay -f stegosaurus $MESSAGE
    else
        echo $MESSAGE
    fi
fi
