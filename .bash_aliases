if [ -x /usr/bin/dircolors ]; then
  alias ls='ls --color=auto -F'
  #alias grep='grep --color=auto'
  alias grep='grep --color=always'
  alias egrep='egrep --color=always'
  alias fgrep='fgrep --color=always'
  alias plgrep='pcregrep --color=always'
else
  alias ls='ls -F'
  alias plgrep='pcregrep'
fi

alias sudo='sudo ' # To allow my aliases to work with sudo

#alias ld='ls -sh' # UNIX command
alias lsd='ls -sh'
alias la='ls -alh'
alias ll='ls -lh'
alias lr='l -R'
alias lt='l -rt'

alias a='alias'
alias b='bc -ql'
alias d='declare -a'
alias e='echo'
alias f='finger'
alias g='git'
alias h='history'
alias j='jobs -l'
alias k='kill'
alias l='la'
alias m="$PAGER"
alias p='ps -ef'
alias s='source'
alias t='tail -f'
alias u='unalias'

alias cp='cp -i'
alias df='df -h'
alias mv='mv -i'
alias rm='rm -i'

alias pa='ps aux'
alias pl='ps -eflyPjH'
alias pt='ps -eflyPjT'
alias topu="top -u $USER"

alias rmo='rm *~ .*~'
alias rma='find . -name "*~" -print -exec rm {} \; &'
alias up='cd ..'

alias xem='xemacs'
alias vi="$EDITOR"

alias st='export TERM=vt100'
alias sc="export DISPLAY=$IP_ADDR:0.0" # Potential UNIX command

alias parallel='parallel --gnu'
alias gitdiff='GIT_EXTERNAL_DIFF="$HOME/bin/git_diff.sh" git diff'

alias ga='git add -A'
alias gb='git branch'
alias gbv='git branch -v'
alias gcb='git checkout -b' # Potential UNIX command
alias gch='git cherry-pick -x'
alias gct='git checkout --track'
alias gco='git checkout' # Potential UNIX command
alias gcv='git commit -v' # Potential UNIX command
alias gd='git diff'
alias gds='git diff --summary'
alias gf='git fetch'
alias gl='git log --graph --relative-date'
alias glg='git log --date=local'
alias gpl='git pull'
alias gps='git push'
alias gr='git remote'
alias grs='git remote show'
alias grso='git remote show origin'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gss='git stash' # Potential UNIX command
alias gst='git status -s' # Potential UNIX command
alias guc='reset --soft HEAD^' # git uncommit
alias gus='reset HEAD' # git unstage

alias setvi='set -o vi'
alias setem='set -o emacs'

alias uk='setxkbmap gb'
alias us='setxkbmap us'

alias nocaps="xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"

alias ver='uname -a && cat /etc/*release'
alias makedot='rm -f Xstuff.tgz && tar cvfz Xstuff.tgz .bash_aliases .bash_completion .bash_functions .bash_local .bash_logout .bash_profile .bashrc .cshrc .emacs .gitconfig .gitignore .git-completion.sh .git-prompt.sh .inputrc .pythonrc .profile .Rprofile* .toprc .vim .vimrc .Xdefaults .xemacs'

alias decol='sed -r "s:\x1B\[[0-9;]*[mK]::g"'
alias lsweb='python -m SimpleHTTPServer'
alias pitime='time echo "scale=5000; 4*a(1)" | bc -l -q'

alias pp="perl -ne 's/(.{1,70})\s/\$1\n/g; \$t .= \$_; END {print \$t}'" # Potential UNIX command
alias makefasta="perl -ne 's/(.{1,70})/\$1\n/g if not /^>/; \$t .= \$_; END {\$t =~ s/\n>/>/g; chomp \$t; print \$t}'"

alias qu="qstat -u $USER"
alias sq="squeue -u $USER" # Potential UNIX command

alias sv='samtools view' # Potential UNIX command
alias si='samtools index'
alias sf='samtools flagstat'

alias printq="perl -e 'foreach (0..40) { \$_%10 == 0 ? printf(qq/%d/, \$_/10) : print qq/ / } \
  print qq/\n/; print \$_%10 foreach 0..40; \
  print qq/\n/; print chr(\$_+33) foreach 0..40; \
  print qq/\n/; print chr(\$_+64) foreach 0..40; print qq/\n/'"

alias printql="perl -e 'foreach (0..93) { \$_%10 == 0 ? printf(qq/%d/, \$_/10) : print qq/ / } \
  print qq/\n/; print \$_%10 foreach 0..93; \
  print qq/\n/; print chr(\$_+33) foreach 0..93; \
  print qq/\n/; print chr(\$_+64) foreach 0..62; print qq/\n/'"

alias ill2sanger="perl -lpe 'BEGIN {\$count = 0} chomp; tr/\x40-\xff\x00-\x3f/\x21-\xe0\x21/ if \$count++ % 4 == 3'"

alias one="awk '{print \$1}'" # Potential UNIX command
alias two="awk '{print \$2}'"
alias three="awk '{print \$3}'"
alias four="awk '{print \$4}'"
alias five="awk '{print \$5}'"
alias six="awk '{print \$6}'" # Potential UNIX command
alias seven="awk '{print \$7}'"
alias eight="awk '{print \$8}'"
alias nine="awk '{print \$9}'"
alias ten="awk '{print \$10}'"

alias onet="awk -F'\t' '{print \$1}'"
alias twot="awk -F'\t' '{print \$2}'"
alias threet="awk -F'\t' '{print \$3}'"
alias fourt="awk -F'\t' '{print \$4}'"
alias fivet="awk -F'\t' '{print \$5}'"
alias sixt="awk -F'\t' '{print \$6}'"
alias sevent="awk -F'\t' '{print \$7}'"
alias eightt="awk -F'\t' '{print \$8}'"
alias ninet="awk -F'\t' '{print \$9}'"
alias tent="awk -F'\t' '{print \$10}'"

alias sum="awk '{s+=\$1} END {print s}'" # UNIX command
alias mean="awk '{s+=\$1} END {print s/NR}'"
alias sd="awk '{s+=\$1;s2+=(\$1*\$1)} END {print sqrt((NR*s2-s*s)/(NR*(NR-1)))}'" # Potential UNIX command
alias sumsq="awk '{s2+=(\$1*\$1)} END {print s2}'"
alias musd="awk '{s+=\$1;s2+=(\$1*\$1)} END {print s/NR,sqrt((NR*s2-s*s)/(NR*(NR-1)))}'"
alias min="awk 'BEGIN {min=1.0e20} {if (\$1<min) min=\$1} END {print min}'"
alias max="awk 'BEGIN {max=-1.0e20} {if (\$1>max) max=\$1} END {print max}'"

alias white="echo -ne '\033]12;white\007'"
alias grey="echo -ne '\033]12;grey\007'"
alias red="echo -ne '\033]12;red\007'" # UNIX command
alias green="echo -ne '\033]12;green\007'"
alias blue="echo -ne '\033]12;RoyalBlue1\007'"
alias black="echo -ne '\033]12;black\007'"
