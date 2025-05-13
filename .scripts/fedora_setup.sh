#!/usr/bin/bash

# Setting up parallel downloads

echo -e "[main]\nmax_parallel_downloads=15\nfastestmirror=True" | sudo tee /etc/dnf/dnf.conf > /dev/null

echo "Updating..."

sudo dnf up -y --refresh

echo "Installing tools and compilers..."

sudo dnf install -y golang gcc g++ clang gdb devel glibc-static git gh tmux neovim fzf fastfetch

# Terminal file manager
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

exit 0
