# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Custom scripts
if ! [[ "$PATH" =~ "$HOME/.scripts:" ]]; then
    export PATH="$HOME/.scripts:$PATH"
fi

# Go
if [ -d ~/go ]; then
    export PATH="$HOME/go/bin:$PATH"
fi
if [ -d ~/.govm ]; then
    export PATH="$HOME/.govm/shim:$PATH"
fi

# Rust
if [ -d ~/.cargo ]; then
    . "$HOME/.cargo/env"
fi

# asdf
if [ -d ~/.asdf ]; then
    export PATH="$HOME/.asdf/shims:$PATH"
fi

# fnm
FNM_PATH="/home/nicolito/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

if which fastfetch >/dev/null 2>&1; then
  fastfetch
fi
