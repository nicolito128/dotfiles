#!/usr/bin/bash

# Setting up parallel downloads

echo -e "[main]\nmax_parallel_downloads=15\nfastestmirror=True" | sudo tee /etc/dnf/dnf.conf > /dev/null

# RPM Fusion (free and nonfree)

sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Updating..."

sudo dnf up -y --refresh

echo "Installing tools and compilers..."

sudo dnf install -y go gcc g++ gdb git gh

# Visual Studio Code

. rpm_install_vscode.sh
