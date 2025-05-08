# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User editor
if which nvim >/dev/null 2>&1; then
    export EDITOR="$( which nvim )"
else
    export EDITOR="$( which nano )"
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Custom scripts
if ! [[ "$PATH" =~ "$HOME/.scripts:" ]]; then
    PATH="$HOME/.scripts:$PATH"
fi

# Go
if [ -d ~/go ]; then
    GOPATH=$HOME/go
    PATH="$HOME/go/bin:$PATH"
fi

# Rust
if [ -d ~/.cargo ]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# asdf
if [ -d ~/.asdf ]; then
    PATH="$HOME/.asdf/shims:$PATH"
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

if which fastfetch >/dev/null 2>&1; then
  fastfetch
fi
