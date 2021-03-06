if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# bash
#export CDPATH=".:..:$HOME/projects:$HOME/src:$HOME/git"

# perl
#export PERL5LIB="$HOME/lib/perl:$PERL5LIB"

# python
#export PYTHONPATH="$HOME/lib/python:$PYTHONPATH"

# java
#export CLASSPATH="$HOME/lib/java:$CLASSPATH"

# C/C++
#export LD_LIBRARY_PATH="$HOME/lib/c:$LD_LIBRARY_PATH"

if [ -f "$HOME/.bash_profile_local" ]; then
  . "$HOME/.bash_profile_local"
fi
