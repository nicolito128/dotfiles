# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User variables
export EDITOR="/usr/bin/nvim"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

if ! [[ "$PATH" =~ "$HOME/.scripts:" ]]; then
    PATH="$HOME/.scripts:$PATH"
fi

export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Go
export GOPATH=$HOME/go
export PATH="$HOME/go/bin:$PATH"

# asdf
export PATH="$HOME/.asdf/shims:$PATH"

if which fastfetch >/dev/null 2>&1; then
  fastfetch
fi
