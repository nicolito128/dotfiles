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

echo "Installing compilers..."

sudo dnf install -y go gcc g++ gdb glibc-static git gh

echo "Adding VSCode repository..."

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo -e \
 "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" \
 | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

dnf check-update

echo "Installing VSCode..."

sudo dnf install -y code

echo "Exporting Code application with distrobox"

distrobox-export --app code
