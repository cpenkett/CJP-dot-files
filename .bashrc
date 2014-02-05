#umask 027
#umask 022
umask 002

[ -z "$PS1" ] && return

set -C

#shopt -s checkjobs
shopt -s checkwinsize
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s no_empty_cmd_completion

[ -x '/usr/bin/lesspipe' ] && eval "$(SHELL=/bin/sh lesspipe)"

red='\[\033[0;31m\]'
brown='\[\033[0;33m\]'
ubrown='\[\033[4;33m\]'
green='\[\033[0;32m\]'
blue='\[\033[0;34m\]'
lblue='\[\033[1;34m\]'
purp='\[\033[0;35m\]'
cyan='\[\033[0;36m\]'
nocol='\[\033[0m\]'

# workstation prompt
PSW="[$green\u$nocol@$brown\h$nocol:$purp\w$nocol]$cyan\!$nocol% "

# server prompt
PSS="[$lblue\$(date +%H:%M)$nocol][$green\u$nocol@$ubrown\h$nocol:$purp\w$nocol]$cyan\!$nocol% "

# standard prompt
PSP="[\u@\h:\w]\!% "

if [ -f "$HOME/.git-prompt.sh" ]; then
  . "$HOME/.git-prompt.sh"
  PSW="[$green\u$nocol@$brown\h$nocol:$purp\w$nocol]$cyan\!$nocol$blue\$(__git_ps1)$nocol% "
  PSS="[$lblue\$(date +%H:%M)$nocol][$green\u$nocol@$brown\h$nocol:$purp\w$nocol]$cyan\!$nocol$blue\$(__git_ps1)$nocol% "
fi

export PS1=$PSW

if [ -f "$HOME/.git-completion.sh" ]; then
  . "$HOME/.git-completion.sh"
fi

if [ "$TERM" = 'xterm' ]; then
  export PROMPT_COMMAND='history -a; echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'
fi

if [ -x '/usr/bin/dircolors' ]; then
  test -r "$HOME/.dircolors" && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

export EDITOR='vim'
export PAGER='less -R'
#export GIT_EXTERNAL_DIFF="$HOME/bin/git_diff.sh"

export LANG='en_GB.utf-8'
export LC_ALL='en_GB.utf-8'
export LANGUAGE='en_GB.utf-8'

TIME_STYLE='+%b %_d %Y %H:%M'
INPUTRC="$HOME/.inputrc"
PYTHONSTARTUP="$HOME/.pythonrc"

export TIME_STYLE INPUTRC PYTHONSTARTUP

#HISTFILE="$HOME/.bash_history"
HISTIGNORE='&:ls:l:lt:lsd:h:j:[bf]g:exit'
HISTCONTROL='ignoreboth'
HISTTIMEFORMAT='[%b %_d %T]  '
HISTFILESIZE=100000
HISTSIZE=100000

#export HISTFILE HISTIGNORE HISTCONTROL HISTTIMEFORMAT HISTFILESIZE HISTSIZE

#IP_ADDR=$(hostname -I | tr -d ' \n')
IP_ADDR='131.111.92.103'

if [ -f "$HOME/.bash_aliases" ]; then
  . "$HOME/.bash_aliases"
fi

if [ -f "$HOME/.bash_functions" ]; then
  . "$HOME/.bash_functions"
fi

if [ -f "$HOME/.bash_local" ]; then
  . "$HOME/.bash_local"
fi

if [ -f "$HOME/.bash_completion" ]; then
  . "$HOME/.bash_completion"
fi

#if [ -f '/etc/bash_completion' ] && ! shopt -oq posix; then
#  . '/etc/bash_completion'
#fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
MANPATH=$MANPATH:$HOME/share/man
