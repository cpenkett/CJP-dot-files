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

#alias sudo='sudo ' # To allow my aliases to work with sudo

#alias ld='ls -sh' # UNIX command
alias lsd='ls -sh'
alias la='ls -alh'
alias ll='ls -lh'
alias lr='l -R'
alias lv='l -v'
alias lt='l -rt'

# TODO: i n o v #w x y z
alias a='alias'
alias b='bc -ql'
alias c="column -t"
alias d='declare -a'
alias e='export -f'
alias f='finger'
alias g='git'
alias h='history'
alias j='jobs -l'
alias k='kill'
alias l='la'
alias m="$PAGER"
alias p='ps -ef'
alias q='quota -v'
alias r='readlink -f'
alias s='source'
alias t='tail -f'
alias u='unalias'

alias cp='cp -i'
alias df='df -h'
alias mv='mv -i'
alias rm='rm -i'
alias rmi='rm -I'
alias ms='$PAGER -S'
alias msf='$PAGER -SF'
alias cs="column -t | ms"
alias cst="column -t -s $'\t' | ms"

alias pa='ps aux'
alias pl='ps -eflyPjH'
alias pt='ps -eflyPjT'
alias topu="top -u $USER"

alias rmo='rm *~ .*~'
alias rma='find . -name "*~" -print -exec rm {} \; &'
alias up='cd ..'

alias xem='xemacs'
alias vi="$EDITOR"
alias setem='set -o emacs'
alias setvi='set -o vi'

alias uk='setxkbmap gb'
alias us='setxkbmap us'
alias nocaps="xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"
alias decol='sed -r "s:\x1B\[[0-9;]*[mK]::g"'

alias st='export TERM=vt100'
#alias sc="export DISPLAY=$IP_ADDR:0.0" # Potential UNIX command
alias sc="export DISPLAY=131.111.92.103:0.0" # Potential UNIX command

alias ver='uname -a && cat /etc/*release'
alias makedot='rm -f Xstuff.tgz && tar cvfz Xstuff.tgz .bash_aliases .bash_completion .bash_functions .bash_local .bash_logout .bash_profile .bashrc .cshrc .emacs .gitconfig .gitignore .git-completion.sh .git-prompt.sh .inputrc .pythonrc .profile .Rprofile* .screenrc .toprc .vim .vimrc .Xdefaults .xemacs'

alias pitime='time echo "scale=5000; 4*a(1)" | bc -ql'
alias lsweb='python -m SimpleHTTPServer'
alias transpose='python -c "import sys; print(\"\n\".join(\" \".join(c) for c in zip(*(l.split() for l in sys.stdin.readlines() if l.strip()))))"'

alias rv="perl -se 'print qq{\\$\?: \$rv;  }; print qq{Error: }, \$rv>>8, q{;  }; print qq{Signal: }, \$rv & 127, qq{\n}' -- -rv=\$?"
alias pp="perl -ne 's/(.{1,70})\s/\$1\n/g; \$t .= \$_; END {print \$t}'" # Potential UNIX command
alias makefasta="perl -ne 's/(.{1,70})/\$1\n/g if not /^>/; \$t .= \$_; END {\$t =~ s/\n>/>/g; chomp \$t; print \$t}'"

alias white="echo -ne '\033]12;white\007'"
alias grey="echo -ne '\033]12;grey\007'"
alias red="echo -ne '\033]12;red\007'" # UNIX command
alias green="echo -ne '\033]12;green\007'"
alias blue="echo -ne '\033]12;RoyalBlue1\007'"
alias black="echo -ne '\033]12;black\007'"

alias awkt="awk -F'\t' -vOFS='\t'"

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
alias summary="awk 'BEGIN {OFS=\"\t\"; min=1.0e20; max=-1.0e20} {if (\$1<min) min=\$1; if (\$1>max) max=\$1; s+=\$1; s2+=(\$1*\$1)} END {print \"count\tmean\tsd\tmin\tmax\n\" NR,s/NR,sqrt((NR*s2-s*s)/(NR*(NR-1))),min,max}'"

alias gitdiff='GIT_EXTERNAL_DIFF="$HOME/bin/git_diff.sh" git diff'

alias ga='git add -A'
alias gap='git add --patch' # Potential UNIX command
alias gb='git branch'
alias gbv='git branch -v'
alias gca='git commit -a'
alias gcb='git checkout -b' # Potential UNIX command
alias gch='git cherry-pick -x'
alias gci='git commit'
alias gco='git checkout' # Potential UNIX command
alias gct='git checkout --track'
alias gcv='git commit -v' # Potential UNIX command
alias gd='git diff'
alias gdc='git diff --cached' # Potential UNIX command
alias gdh='git diff HEAD'
alias gds='git diff --summary'
alias gf='git fetch'
alias gl='git log --graph --relative-date'
alias glg='git log --date=local'
alias gls='git log --pretty=medium'
alias gnb='git checkout -b'
alias gpl='git pull'
alias gps='git push'
alias gr='git remote'
alias grv='git remote -v'
alias grs='git remote show'
alias grso='git remote show origin'
alias gsa='git stash apply'
alias gsb='git show-branch'
alias gsc='git stash clear' # Potential UNIX command
alias gsd='git stash drop'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gss='git stash' # Potential UNIX command
alias gst='git status -s' # Potential UNIX command
alias gsta='git status' # Potential UNIX command
alias gt='git tag -l'
alias gucommit='reset --soft HEAD^'
alias gustage='reset HEAD' # git unstage

alias modver="perl -e\"eval qq{use \\\$ARGV[0];\\\\\\\$v=\\\\\\\$\\\${ARGV[0]}::VERSION;};\ print\\\$@?qq{No module found\\n}:\\\$v?qq{Version \\\$v\\n}:qq{Found.\\n};\"\$1"

alias sv='samtools view' # Potential UNIX command
alias si='samtools index'
alias sf='samtools flagstat'
alias sid='samtools idxstats'

alias bv='bcftools view'
alias bvg='bcftools view -GH'
alias bvh='bcftools view -H'
alias bi='bcftools index'
alias bq='bcftools query'
alias bs='bcftools stats'

alias printq="perl -e 'foreach (0..40) { \$_%10 == 0 ? printf(qq/%d/, \$_/10) : print qq/ / } \
  print qq/\n/; print \$_%10 foreach 0..40; \
  print qq/\n/; print chr(\$_+33) foreach 0..40; \
  print qq/\n/; print chr(\$_+64) foreach 0..40; print qq/\n/'"

alias printql="perl -e 'foreach (0..93) { \$_%10 == 0 ? printf(qq/%d/, \$_/10) : print qq/ / } \
  print qq/\n/; print \$_%10 foreach 0..93; \
  print qq/\n/; print chr(\$_+33) foreach 0..93; \
  print qq/\n/; print chr(\$_+64) foreach 0..62; print qq/\n/'"

alias ill2sanger="perl -lpe 'BEGIN {\$count = 0} chomp; tr/\x40-\xff\x00-\x3f/\x21-\xe0\x21/ if \$count++ % 4 == 3'"
