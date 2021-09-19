zmodload zsh/zprof

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt autocd notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
#zstyle :compinstall filename '/home/unemployed/.zshrc'
# End of lines added by compinstall

# On slow systems, checking the cached .zcompdump file to see if it must be
# regenerated adds a noticable delay to zsh startup.  This little hack restricts
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - '.' matches "regular files"
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

source $HOME/.profile

# Start X server after login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
