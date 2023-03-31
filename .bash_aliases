alias ta="tmux -u attach -t"
alias tl="tmux list-sessions"
alias ts="tmux -u new-session -s"
alias tksv="tmux kill-server"
alias tkss="tmux kill-session -t"
alias tmux="tmux -u"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias la="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias glog="git log --graph"
alias glogs="git log --stat"
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias gb="git branch"
alias gco="git checkout"
alias gst="git status"
alias gcsm="git commit -s -S"
alias gpoh="git push origin HEAD"
alias gd="git diff"
alias gds="git diff --stat"
alias gss="git status -s"
alias ga="git add"
alias gsl="git stash list"
alias glog1="git log -1 --stat"

__git_complete gco	_git_checkout
__git_complete gb	_git_branch
__git_complete gp 	_git_push
__git_complete gd 	_git_diff

alias vi="vim"
alias nowrap="expand | cut -c-$COLUMNS"

alias k="kubectl"
alias kgp="kubectl get pods"
alias kdp="kubectl describe pods"
alias keti="kubectl exec -ti"
alias kdel="kubectl delete"
alias kdelf="kubectl delete -f"
alias kcp="kubectl cp"

alias mc="/root/RobinSystems/object-store/minio/mc"

