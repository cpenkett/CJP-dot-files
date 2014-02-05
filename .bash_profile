if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# bash
export PATH="$HOME/bin:$HOME/bin/`uname`:$HOME/src/play-1.2.2:$PATH"
#export CDPATH=".:..:$HOME/project:$HOME/src:/home:/data:/software:/scratch/$USER"

# perl
PERL5LIB="$HOME/src/vcftools_0.1.11/perl"
#PERL5LIB="$HOME/perl5"
#PERL5LIB="$HOME/src/bioperl-1.2.3:$HOME/src/BioPerl-1.6.0"
#PERL5LIB="$PERL5LIB:$HOME/cvs/ensembl/modules:$HOME/cvs/ensembl-compara/modules:$HOME/cvs/ensembl-variation/modules:$HOME/cvs/ensembl-functgenomics/modules"
#PERL5LIB="$PERL5LIB:$HOME/git/easih-toolbox/modules/"
#PERL5LIB="$PERL5LIB:$HOME/src/vcftools_0.1.10/perl"
export PERL5LIB

# python
#export PYTHONPATH=".:$HOME/lib"

# java
#export CLASSPATH="/usr/share/java:$HOME/svn/picard/trunk/src/java:$HOME/lib/java/snappy-java-1.0.3-rc2.jar:$HOME/project/src/java/src"

# C/C++
#export LD_LIBRARY_PATH="$HOME/src/zlib-1.2.7:/usr/lib/R/lib:$HOME/src/bamtools-1.0.2/lib:$HOME/src/root/lib:$LD_LIBRARY_PATH"

# RDP java: http://rdp.cme.msu.edu/classifier/classifier.jsp
#export RDP_JAR_PATH="$HOME/src/rdp_classifier/rdp_classifier-2.0.jar"

# root
#export ROOTSYS=$HOME/src/root
