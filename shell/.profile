# Set a sensible default editor
export EDITOR=vim

# XDG specification exports
export XDG_CACHE_HOME="/tmp/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Override default .vimrc location
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# Make ~/.toys folder executable
export PATH="${PATH}:$HOME/.toys:$HOME/bin"

# Add local site packages to PYTHONPATH
export PYTHONPATH="${PYTHONPATH}:/home/unemployed/.local/lib/python3.7/site-packages"
