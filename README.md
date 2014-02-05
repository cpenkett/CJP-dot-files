CJP-dot-files
=============

**My UNIX dot/rc files**

*Save original dot files*

```bash
alias makedot='rm -f Xstuff.tgz && tar cvfz Xstuff.tgz .bash_aliases .bash_completion .bash_functions .bash_local .bash_logout .bash_profile .bashrc .cshrc .emacs .gitconfig .gitignore .git-completion.sh .git-prompt.sh .inputrc .pythonrc .profile .Rprofile* .toprc .vim .vimrc .Xdefaults .xemacs'
```

*This alias saves the old files to an archive file called Xstuff.tgz*

```bash
makedot
```

*This forcibly copies the dot files to the home directory*

```bash
for f in .*; do if [[ "$f" == ".git" || "$f" == "." || "$f" == ".." ]]; then echo "  Not copying $f"; else \cp -vr $f ~; fi; done
```
