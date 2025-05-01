#!/usr/bin/bash

# Setting up parallel downloads

echo -e "[main]\nmax_parallel_downloads=15\nfastestmirror=True" | sudo tee /etc/dnf/dnf.conf > /dev/null

echo "Updating..."

sudo dnf up -y --refresh

echo "Installing tools and compilers..."

sudo dnf install -y go gcc g++ rust gdb glibc-static git gh tmux neovim fastfetch

exit 0
