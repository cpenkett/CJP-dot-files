if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# bash
export PATH="$HOME/bin:$HOME/bin/$(uname):$PATH"
#export CDPATH=".:..:$HOME/projects:$HOME/src:$HOME/git"

# perl
#export PERL5LIB="$HOME/lib/perl:$PERL5LIB"

# python
#export PYTHONPATH="$HOME/lib/python:$PYTHONPATH"

# java
#export CLASSPATH="$HOME/lib/java:$CLASSPATH"

# C/C++
#export LD_LIBRARY_PATH="$HOME/lib/c:$LD_LIBRARY_PATH"

if [ -f "$HOME/.profile_local" ]; then
  . "$HOME/.profile_local"
fi
