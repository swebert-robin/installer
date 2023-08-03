function __git_ps1() {
    true
}

function take() {
    mkdir -p $1
    cd $1
}

if [[ ! -f ~/.ip_addr ]]; then
    hostname -I | awk '{print $1}' > ~/.ip_addr
fi

[ -f /etc/bashrc                ] && source /etc/bashrc
[ -f /root/.fzf.bash            ] && source /root/.fzf.bash
[ -f /root/bin/robinrc          ] && source /root/bin/robinrc
[ -f /root/.git-prompt.bash     ] && source /root/.git-prompt.bash
[ -f /root/.git-completion.bash ] && source /root/.git-completion.bash
[ -f /root/.wd                  ] && source /root/.wd
[ -f /root/.bash_aliases        ] && source /root/.bash_aliases

 NORMAL="\[\033[0m\]"
    RED="\[\033[1;31m\]"                # bold text (...[1;...)
  GREEN="\[\033[0;32m\]"                # bold text (...[1;...)
 YELLOW="\[\033[0;33m\]"
   BLUE="\[\033[1;34m\]"
MAGENTA="\[\033[0;35m\]"
   CYAN="\[\033[1;36m\]"

# show most recent error code in prompt
PS1="\$(ERR_CODE="\$?" ; if [ \$ERR_CODE != 0 ]; then echo \"${RED}\$ERR_CODE${NORMAL} \"; fi)"
PS1+="${GREEN}\$(cat ~/.ip_addr) ${CYAN}\W ${MAGENTA}\$(__git_ps1 '%s ')${NORMAL}"

# https://stackoverflow.com/a/19533853
# ------------------------------------

# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# export HISTIGNORE="ignoreboth"

# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history

# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export EDITOR=vi
export VISUAL=vi

ulimit -c unlimited
