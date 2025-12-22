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

# Enable git branch in prompt
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    . /usr/share/git/completion/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
fi

# Bash Prompt
PROMPT_COMMAND='if [ -n "$(git branch --show-current 2>/dev/null)" ]; then PS1_CMD1=" [$(git branch --show-current)]"; else PS1_CMD1=""; fi'
PS1='\[\033[38;2;166;227;161m\]\u\[\033[0m\]@\[\033[38;2;137;180;250m\]\h\[\033[0m\]:\[\033[38;2;249;226;175m\]\W\[\033[0m\]\[\033[38;2;205;214;244m\]\[\033[38;2;245;194;231m\]${PS1_CMD1}\[\033[38;2;205;214;244m\] \$ \[\033[0m\]'

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

# Profile
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi

# Binaries and other scripts
export FNM_PATH="$HOME/.local/share/fnm"
export PHP_INI_SCAN_DIR="$HOME/.config/herd-lite/bin"
export PNPM_HOME="$HOME/.local/share/pnpm"

user_bin_dirs=(
    "$HOME/.local/bin"
    "$HOME/bin"
    "$HOME/.scripts.d"
    "$HOME/go/bin"
    "$HOME/.govm/shim"
    "$HOME/.cargo/env"
    "$HOME/.asdf/shims"
    "$FNM_PATH"
    "$PHP_INI_SCAN_DIR"
    "$PNPM_HOME"
)

# Add directories to PATH if they exist
for dir in "${user_bin_dirs[@]}"; do
    if [ -d "$dir" ] && [[ ":$PATH:" != *":$dir:"* ]]; then
        export PATH="$dir:$PATH"
    fi
done

# Homebrew specific
if [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Rust load
if [ -d "$HOME/.cargo" ]; then
    [ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
fi

# FNM load
if [ -d "$FNM_PATH" ]; then
    eval $(fnm env)
fi

# ~/opt source
if [ -f ~/.opt ]; then
    source "$HOME/.opt"
fi

# Run fastfetch if available
if command -v fastfetch >/dev/null; then
    fastfetch
fi
