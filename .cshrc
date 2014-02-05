umask 022

if (! $?prompt) then
  exit(0)
endif

echo
echo "Loading .cshrc"
echo

source /etc/csh.cshrc

set prompt='[%n@%m:%c4]\!% '

#xrdb -merge ~/.Xdefaults

unset ignoreeof
unset nologout
unset autologout

limit coredumpsize 0

set addsuffix
set autocorrect
set autoexpand
set autolist
set chase_symlinks
set ellipsis
set filec
set history = 1000
set savehist = (1000 merge)
set nobeep
set noclobber

set path = ( /software/bin $HOME/bin $HOME/bin/`uname` $HOME/bin/`uname -m` $path . )
set cdpath = ( $HOME /home /data /software )

bindkey "^[[1;5D" vi-word-back
bindkey "^[[1;5C" vi-word-fwd

#bindkey "\e[1;5D" backward-word
#bindkey "\e[1;5C" forward-word

#bindkey -k up   history-search-backward
#bindkey -k down history-search-forward

bindkey "\e[A": history-search-backward
bindkey "\e[B": history-search-forward

#bindkey -b ^W backward-delete-word
#bindkey -b ^U backward-kill-line
#bindkey -b ^R complete-word-fwd
#bindkey -b ^I expand-history
#bindkey -b ^O complete-word-raw

#bindkey -b M-g list-glob
#bindkey -b M-* expand-glob
#bindkey -b M-v expand-variables
#bindkey -b M-w normalize-command
#bindkey -b M-/ which-command
#bindkey -b M-r i-search-back
#bindkey -b M-s i-search-fwd

alias ls    'ls --color=auto -F'
alias ld    'ls -sh'
alias l     'ls -alh'
alias grep  'grep --color=auto'

alias a     'alias'
alias cp    'cp -i'
alias egrep 'grep -E'
alias em    'xemacs'
alias f     'finger'
alias fgrep 'grep -F'
alias h     'history'
alias j     'jobs -l'
alias k     'kill'
alias lt    'l -rt'
alias m     'less'
alias mv    'mv -i'
alias p     'ps -edf'
alias pg    'p | egrep'
alias rm    'rm -i'
alias rmo   'rm *~ .*~'
alias s     'source'
alias sc    'setenv DISPLAY 131.111.83.138:0.0'
alias st    'setenv TERM vt100'
alias t     'tail -f'
alias u     'unalias'
alias up    'cd ..'

alias kg      'p | grep \!* | grep -v grep | two | xargs kill -9'
alias pp      perl -ne \''s/(.{1,70})\s/$1\n/g; $t .= $_; END {print $t}'\'
alias rmo_all 'find . -name "*~" -print -exec rm {} \; &'
alias uzt     'gzip -dc \!* | tar xvf -'

alias sv 'samtools view'
alias si 'samtools index'
alias sf 'samtools flagstat'

alias one   awk \''{print $1}'\'
alias two   awk \''{print $2}'\'
alias three awk \''{print $3}'\'
alias four  awk \''{print $4}'\'
alias five  awk \''{print $5}'\'
alias six   awk \''{print $6}'\'
alias seven awk \''{print $7}'\'
alias eight awk \''{print $8}'\'
alias nine  awk \''{print $9}'\'
alias ten   awk \''{print $10}'\'
alias sum   awk \''{s+=$1} END {print s}'\'
alias mean  awk \''{s+=$1} END {print s/NR}'\'
alias sd    awk \''{s+=$1;s2+=($1*$1)} END {print sqrt((NR*s2-s*s)/(NR*(NR-1)))}'\'
alias sumsq awk \''{s2+=($1*$1)} END {print s2}'\'
alias musd  awk \''{s+=$1;s2+=($1*$1)} END {print s/NR,sqrt((NR*s2-s*s)/(NR*(NR-1)))}'\'
alias min   awk \''BEGIN {min=1.0e20} {if ($1<min) min=$1} END {print min}'\'
alias max   awk \''BEGIN {max=-1.0e20} {if ($1>max) max=$1} END {print max}'\'

alias onet   awk -F\""\011"\" \''{print $1}'\'
alias twot   awk -F\""\011"\" \''{print $2}'\'
alias threet awk -F\""\011"\" \''{print $3}'\'
alias fourt  awk -F\""\011"\" \''{print $4}'\'
alias fivet  awk -F\""\011"\" \''{print $5}'\'
alias sixt   awk -F\""\011"\" \''{print $6}'\'
alias sevent awk -F\""\011"\" \''{print $7}'\'
alias eightt awk -F\""\011"\" \''{print $8}'\'
alias ninet  awk -F\""\011"\" \''{print $9}'\'
alias tent   awk -F\""\011"\" \''{print $10}'\'

alias prstart 'sudo /etc/init.d/cups restart'

setenv EDITOR vi
#setenv PAGER  less
where more > /dev/null && setenv PAGER more
where less > /dev/null && setenv PAGER less
where most > /dev/null && setenv PAGER most

setenv CVSREAD   on
setenv CVS_RSH   /usr/bin/ssh
setenv CVSEDITOR vi
#setenv CVSROOT   ":local:/ebi/msd/nmrqual/chris/cvsroot"

setenv PYTHONSTARTUP $HOME/.pythonrc

setenv PERL5LIB ${HOME}/src/bioperl-1.2.3
setenv PERL5LIB ${PERL5LIB}:${HOME}/src/BioPerl-1.6.0

#setenv PERL5LIB ${HOME}/cvs/bioperl-live

# One of these sections should be right!

#setenv PERL5LIB ${PERL5LIB}:${HOME}/src/ensembl/modules
#setenv PERL5LIB ${PERL5LIB}:${HOME}/src/ensembl-compara/modules
#setenv PERL5LIB ${PERL5LIB}:${HOME}/src/ensembl-variation/modules
#setenv PERL5LIB ${PERL5LIB}:${HOME}/src/ensembl-functgenomics/modules

setenv PERL5LIB ${PERL5LIB}:${HOME}/cvs/ensembl/modules
setenv PERL5LIB ${PERL5LIB}:${HOME}/cvs/ensembl-compara/modules
setenv PERL5LIB ${PERL5LIB}:${HOME}/cvs/ensembl-variation/modules
setenv PERL5LIB ${PERL5LIB}:${HOME}/cvs/ensembl-functgenomics/modules

#setenv PERL5LIB ${PERL5LIB}:${HOME}/svn/reseqtrack/modules

setenv CLASSPATH  $HOME/src/FastQC
setenv PYTHONPATH $HOME/src/ccpnmr/ccpnmr2.1/python

setenv CATALINA_BASE $HOME/src/apache-tomcat-6.0.29
setenv CATALINA_HOME $HOME/src/apache-tomcat-6.0.29
setenv JRE_HOME      /usr/lib/jvm/java-6-sun
setenv JAVA_HOME     /usr/lib/jvm/java-6-sun/jre/bin
setenv JAVA_OPTS     "-Dsecurity.method=jdbc"

setenv MYSQLINC  "/usr/include/mysql"
setenv MYSQLLIBS "/usr/lib64/mysql/libmysqlclient.a -lz"
setenv MANPATH ${MANPATH}:${HOME}/share/man
