alias ll='ls -alF'
alias la='ls -A'
alias l='ls -lAhtr'
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

