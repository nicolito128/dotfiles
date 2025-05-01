#!/usr/bin/bash

echo "Adding Microsoft and VSCode repository..."

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo \
  -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" \
  | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

echo "Installing VSCode..."

dnf check-update
sudo dnf install -y code

echo "Exporting Code application"

distrobox-export --app code
