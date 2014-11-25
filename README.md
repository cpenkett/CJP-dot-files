CJP-dot-files
=============

**My UNIX dot/rc files**

*Save original dot files - this alias can be used to save the old files to an archive file called Xstuff.tgz*

```bash
alias makedot='rm -f Xstuff.tgz && tar cvfz Xstuff.tgz .bash_aliases .bash_completion .bash_functions .bash_local .bash_logout .bash_profile .bashrc .cshrc .emacs .gitconfig .gitignore .git-completion.sh .git-prompt.sh .inputrc .pythonrc .profile .Rprofile* .toprc .vim .vimrc .Xdefaults .xemacs'
makedot
```

*Clone this git repository and forcibly copy the dot files to the home directory*

```bash
git clone git@github.com:cpenkett/CJP-dot-files.git
cd CJP-dot-files
for f in .*; do if [[ "$f" == ".git" || "$f" == "." || "$f" == ".." ]]; then echo "  Not copying $f"; else /bin/cp -vr $f ~; fi; done
#for f in .*; do echo "- $f -"; if [[ "$f" == ".bash_local"|| "$f" == ".git" || "$f" == ".xemacs" || "$f" == "." || "$f" == ".." ]]; then echo "  Not copying $f"; else sdiff -s $f ~ 2> /dev/null; fi; echo; done | grep -Ev "Not copying|Only" | m
```
