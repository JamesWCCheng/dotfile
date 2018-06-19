case $- in
    *i*) ;;
      *) return;;
esac

[ -r ~/.bash_aliases ] && . ~/.bash_aliases

[ -r /etc/bash_completion ] && . /etc/bash_completion
[ -r /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -r ~/.bash_completion ] && . ~/.bash_completion

export CLICOLOR='true'
export EDITOR=subl
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$HOME/.local/sbin:$PATH"

export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
shopt -s histappend

shopt -s checkwinsize

function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

GREEN="\[\033[0;32m\]"
DEFAULT="\[\033[0m\]"
export PS1="\u@\h:\W $GREEN\$(parse_git_branch)$DEFAULT\\$ "
#### Change terminal title
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

[ -r ~/.bashrc_loader ] && . ~/.bashrc_loader
