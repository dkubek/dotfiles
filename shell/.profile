# XDG specification exports
export XDG_CACHE_HOME="/tmp/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Override default .vimrc location
#export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# Make ~/.toys folder executable
export PATH="${PATH}:$HOME/.toys:$HOME/bin"

export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Add local site packages to PYTHONPATH
export PYTHONPATH="${PYTHONPATH}:/home/unemployed/.local/lib/python3.7/site-packages"

# added by Nix installer
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]
then 
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi 

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in *:/home/dkubek/.julia/juliaup/bin:*);; *)
    export PATH=/home/dkubek/.julia/juliaup/bin${PATH:+:${PATH}};;
esac

# <<< juliaup initialize <<<
