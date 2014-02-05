err() { "$@" 2> >(while read line; do echo -e "\e[01;31m$line\e[0m"; done); }
err2() { "$@" 2> >(while read line; do echo -e "\e[01;31m$line\e[0m" >&2; done); }
#bind 'RETURN: "\e[1~err \e[4~\n"'

pg() { # UNIX command

  if [ $# -eq 0 ]; then 
    return
  fi

  local proc=$1

  ps -ef | \egrep --color=always "^UID|$proc" | \grep --color=never -v grep

}

pgr() {

  if [ $# -eq 0 ]; then 
    return
  fi

  local proc=$1
  local time=3

  if [ $# -gt 1 ]; then
    time=$2
  fi

  ps aux | head -1

  while true; do
    ps aux | \egrep --color=always "$proc" | \grep --color=never -v grep
    if [[ ${PIPESTATUS[1]} -eq 1 || ${PIPESTATUS[2]} -eq 1 ]]; then
      break
    fi
    sleep $time
  done

}

kg() {

  if [ $# -eq 0 ]; then
    return
  fi

  local proc=$1

  ps -ef | \grep --color=never "$proc" | \grep --color=never -v grep | awk '{print $2}' | xargs kill

}

kgr() {

  if [ $# -eq 0 ]; then
    return
  fi

  local proc=$1
  local time=3

  if [ $# -gt 1 ]; then
    time=$2
  fi

  ps aux | head -1

  while true; do
    ps aux | \egrep --color=always "$proc" | \grep --color=never -v grep
    if [[ ${PIPESTATUS[1]} -eq 1 || ${PIPESTATUS[2]} -eq 1 ]]; then
      break
    fi
    mem=$(ps aux | \egrep --color=always "$proc" | \grep --color=never -v grep | awk '{print $4}')
    if [[ $mem > 95 ]]; then
      echo "Memory too high: [$mem%] > 95 - killing $proc"
      ps aux | \grep --color=never "$proc" | \grep --color=never -v grep | awk '{print $2}' | xargs kill
    fi
    sleep $time
  done

}

md() {

  if [ $# -eq 0 ]; then
    return
  fi

  local dir=$1

  if [ -f $dir ]; then
    echo "File $dir exists"
    return
  fi

  if [ -d $dir ]; then
    echo "Directory $dir exists"
    return
  fi

  mkdir -p $dir
  cd $dir

}

mdr() {

  if [ $# -eq 0 ]; then
    return
  fi

  local dir=$1

  if [ -d $dir ]; then
    echo "Removing directory $dir"
    rm -rf $dir
  fi

  if [ -f $dir ]; then
    echo "File $dir exists"
    return
  fi

  mkdir -p $dir
  cd $dir

}

em() {

  local emacs='emacs --geometry=94x46 --font=9x15'

  if [ $# -eq 0 ]; then
    $emacs
  else
    $emacs --title=$1 $1
  fi

}

col () {

  local col=$1
  local file=$2
  awk '{print $'$col'}' $file

}

foreach() {

  if [ $# -eq 0 ]; then
    return
  fi

  local func=$1
  shift

  local arg
  for arg in $@; do
    ${func} ${arg}
  done

}

foreacha() {

  if [ $# -eq 0 ]; then
    return
  fi

  local -a array=( $1 )
  local func='cat'

  if [ $# -gt 1 ]; then
    func=$2
  fi

  local i
  for i in ${array[@]}; do
    ${func} $i
  done

}

genpasswd() {

  local l=$1
  [ "$l" == "" ] && l=16
  tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs

}

isnow() {

  clear
  while :; do
    echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS ))
    sleep 0.1
  done | awk '{a[$3] = 0; for (x in a) {o = a[x]; a[x] = a[x] + 1; printf "\033[%s;%sH ", o, x; printf "\033[%s;%sH*\033[0;0H", a[x], x} }'

}

encode() {
  
  if [ $# -eq 0 ]; then
    return
  fi

  echo -n $@ | perl -pe 's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1) )/seg'

}

google() {
  
  if [ $# -eq 0 ]; then
    return
  fi

  firefox http://www.google.com/search?hl=en#q="$(encode $@)"

}

scount() {

  if [ $# -eq 0 ]; then
    return
  fi

  local bam=$1

  #python -c 'import pysam, sys; print reduce(lambda x, y: x + y, [ eval("+".join(l.rstrip("\n").split("\t")[2:]) ) for l in pysam.idxstats(sys.argv[1]) ])' $bam
  python -c 'from pysam import Samfile as f; from sys import argv as a; s = f(a[1]); print s.mapped + s.unmapped' $bam

}

svx() { # Potential UNIX command

  if [ $# -eq 0 ]; then
    return
  fi
  
  local bam=$1
  
  samtools view -hX $bam | $PAGER

}

svc() { # Potential UNIX command

  if [ $# -eq 0 ]; then
    return
  fi

  local bam=$1

  if [ $# -gt 1 ]; then
    samtools view -hX $bam | perl -F\\t -ane 'print, next if /^@/; @bases = split "", $F[9]; @quals = split "", $F[10]; $seq = ""; foreach $b (@bases) { $col = "\e[0;37m"; if ($b eq "A") {$col = "\e[0;32m"} elsif ($b eq "C") {$col = "\e[0;34m"} elsif ($b eq "G") {$col = "\e[0;35m"} elsif ($b eq "T") {$col = "\e[0;33m"} else {$col = "\e[0;31m"} $seq .= "$col$b\e[0m" } $qual = ""; foreach $q (@quals) { $score = ord($q)-33; $col = "\e[0m"; if ($score < 15) {$col = "\e[0;31m"} elsif ($score < 30) {$col = "\e[0;33m"} else {$col = "\e[0;32m"} $qual .= "$col$q\e[0m" } $F[9] = $seq; $F[10] = $qual; print join "\t", @F[0..10], "\n"' | $PAGER
  else
    #samtools view -hX $bam | perl -F\\t -ane 'print, next if /^@/; @bases = split "", $F[9]; @quals = split "", $F[10]; $seq = ""; $qual = ""; $i = 0; foreach $q (@quals) { $b = $bases[$i]; $i++; $score = ord($q)-33; $col = "\e[0m"; if ($score < 15) {$col = "\e[0;31m"} elsif ($score < 30) {$col = "\e[0;33m"} else {$col = "\e[0;32m"} $seq .= "$col$b\e[0m"; $qual .= "$col$q\e[0m" } $F[9] = $seq; $F[10] = $qual; print join "\t", @F' | $PAGER
    samtools view -hX $bam | perl -F\\t -ane 'print, next if /^@/; @bases = split "", $F[9]; @quals = split "", $F[10]; $seq = ""; $i = 0; foreach $q (@quals) { $b = $bases[$i]; $i++; $score = ord($q)-33; $col = "\e[0m"; if ($score < 15) {$col = "\e[0;31m"} elsif ($score < 30) {$col = "\e[0;33m"} else {$col = "\e[0;32m"} $seq .= "$col$b\e[0m" } $F[9] = $seq; print join "\t", @F[0..9], "\n"' | $PAGER
  fi

}

fqview() {

  if [ $# -eq 0 ]; then
    return
  fi

  local fq=$1

  if [ $# -gt 1 ]; then
    zcat -f $fq | perl -ne '$line2 = <>; $line3 = <>; $line4 = <>; @bases = split "", $line2; @quals = split "", $line4; $seq = ""; foreach $b (@bases) { $col = "\e[0;37m"; if ($b eq "A") {$col = "\e[0;32m"} elsif ($b eq "C") {$col = "\e[0;34m"} elsif ($b eq "G") {$col = "\e[0;35m"} elsif ($b eq "T") {$col = "\e[0;33m"} else {$col = "\e[0;31m"} $seq .= "$col$b\e[0m" } $qual = ""; foreach $q (@quals) { $score = ord($q)-33; $col = "\e[0;37m"; if ($score < 15) {$col = "\e[0;31m"} elsif ($score < 30) {$col = "\e[0;33m"} else {$col = "\e[0;32m"} $qual .= "$col$q\e[0m" } print "$_$seq$line3$qual"' | $PAGER
  else
    zcat -f $fq | perl -ne '$line2 = <>; $line3 = <>; $line4 = <>; @bases = split "", $line2; @quals = split "", $line4; $seq = ""; $i = 0; foreach $q (@quals) { $b = $bases[$i]; $i++; $score = ord($q)-33; $col = "\e[0;37m"; if ($score < 15) {$col = "\e[0;31m"} elsif ($score < 30) {$col = "\e[0;33m"} else {$col = "\e[0;32m"} $seq .= "$col$b\e[0m" } print "$_$seq"' | $PAGER
  fi 

}

svrand() {

 if [ $# -eq 0 ]; then
    return
  fi

  local bam=$1
  local n=100000

  if [ $# -gt 1 ]; then
    n=$2
  fi

  sv -X $bam | shuf | head -n $n | cat <(sv -H $bam) - | perl -F\\t -ane 'print, next if /^@/; @bases = split "", $F[9]; @quals = split "", $F[10]; $seq = ""; $i = 0; foreach $q (@quals) { $b = $bases[$i]; $i++; $score = ord($q)-33; $col = "\e[0m"; if ($score < 15) {$col = "\e[0;31m"} elsif ($score < 30) {$col = "\e[0;33m"} else {$col = "\e[0;32m"} $seq .= "$col$b\e[0m" } $F[9] = $seq; print join "\t", @F[0..9], "\n"' | $PAGER

}

fqrand() {

  if [ $# -eq 0 ]; then
    return
  fi

  local fq=$1
  local n=100000

  if [ $# -gt 1 ]; then
    n=$2
  fi

  zcat -f $fq | perl -ne 'chomp; chomp($line2 = <>); chomp($line3 = <>); $line4 = <>; print "$_$line2$line3$line4"' | shuf | head -n $n | tr '' '\n'

}

fqrv () {

  if [ $# -eq 0 ]; then
    return
  fi

  local fq=$1

  zcat -f $fq | head -n 2000000 | fqrand - 1000 | fqview -

}

prob2phred() {

  if [ $# -eq 0 ]; then
    return
  fi

  local prob=$1

  perl -sle 'print -10 * ( (log $prob)/(log 10) )' -- -prob=$$prob

}

phred2prob() {

  if [ $# -eq 0 ]; then
    return
  fi

  local phred=$1

  perl -sle 'print 10**(-1.0*$phred/10)' -- -phred=$1

}
