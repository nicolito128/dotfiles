# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# User editor
if command -v nvim &> /dev/null; then
    export EDITOR='nvim'
    export MANPAGER='nvim +Man!'
else
    export EDITOR='nano'
fi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export PS1='\[\e]0;\w\a\]\n\[\e[34m\]\u@\h\[\e[m\]:\[\e[33m\]\W\[\e[m\]\$ '

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# User binaries
{
    declare -r FNM_PATH="$HOME/.local/share/fnm"
    declare -r DOTNET_ROOT="$HOME/dotnet"
} &>/dev/null

user_bin_dirs=(
    "$HOME/.local/bin"
    "$HOME/bin"
    "$HOME/.scripts"
    "$HOME/go/bin"
    "$HOME/.govm/shim"
    "$HOME/.cargo/env"
    "$HOME/.asdf/shims"
    "$FNM_PATH"
    "$DOTNET_ROOT"
)

# Add directories to PATH if they exist
for dir in "${user_bin_dirs[@]}"; do
    if [ -d "$dir" ] && [[ ":$PATH:" != *":$dir:"* ]]; then
        export PATH="$dir:$PATH"
    fi
done

# Rust load
if [ -d "$HOME/.cargo" ]; then
    [ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
fi

# FNM load
if [ -d "$FNM_PATH" ]; then
  eval "`fnm env`"
fi

# Run fastfetch if available
if command -v fastfetch >/dev/null; then
    fastfetch
fi
